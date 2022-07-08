// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:sportzride/common/prefs.dart';
import 'package:sportzride/data/models/wallet_model.dart';
import 'package:sportzride/presentation/blocs/auth/auth_cubit.dart';
import 'package:sportzride/presentation/journeys/splash_screen/splash_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class SRDrawer extends StatefulWidget {
  const SRDrawer({Key? key}) : super(key: key);

  @override
  _SRDrawerState createState() => _SRDrawerState();
}

class _SRDrawerState extends State<SRDrawer> {
  late AuthCubit authCubit;
  User? user = FirebaseAuth.instance.currentUser;
  WalletModel loggedInUser = WalletModel();

  @override
  void initState() {
    super.initState();
    // FirebaseFirestore.instance
    //     .collection("wallets")
    //     .doc(user!.uid)
    //     .get()
    //     .then((value) {
    //   loggedInUser = WalletModel.fromMap(value.data());
    //   authCubit = BlocProvider.of<AuthCubit>(context);
    //   setState(() {});
    // });

    authCubit = BlocProvider.of<AuthCubit>(context);
    getSharedPrefs();
  }

  Future<Null> getSharedPrefs() async {
    loggedInUser.email = await Prefs.getEmail();
    loggedInUser.username = await Prefs.getUserName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.bgMain,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(loggedInUser.username.toString()),
            accountEmail: Text(loggedInUser.email.toString()),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/samplepp.jpg'),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/coverp.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            onDetailsPressed: () {},
          ),
          ListTile(
            title: const Text(
              'Leaderboard',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.leaderboard,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'My Badges',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.badge,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'My Rewards',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.redeem,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Refer & Earn',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Blogs',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.newspaper,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Report a Bug',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.bug_report,
              color: Colors.white,
            ),
            onTap: () async {
              EmailContent email = EmailContent(
                to: [
                  'breeje.modi@sportzride.com',
                ],
                subject: 'Sportzride App: Reporting a Bug',
              );

              OpenMailAppResult result =
                  await OpenMailApp.composeNewEmailInMailApp(
                      nativePickerTitle: 'Select email app to compose',
                      emailContent: email);
              if (!result.didOpen && !result.canOpen) {
                // ignore: use_build_context_synchronously
                showNoMailAppsDialog(context);
              } else if (!result.didOpen && result.canOpen) {
                showDialog(
                  context: context,
                  builder: (_) => MailAppPickerDialog(
                    mailApps: result.options,
                    emailContent: email,
                  ),
                );
              }
            },
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(color: AppTheme.powder),
            ),
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onTap: () {
              showLogoutDialog(context);
            },
          ),
          BlocConsumer<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is AuthError,
              builder: (context, state) {
                if (state is AuthError) {
                  return const SizedBox.shrink();
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is AuthLogoutLoaded,
              listener: (context, state) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                    (route) => false);
              }),
        ],
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure you want to Log Out?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.pop(context);
                authCubit.logoutUser();
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Open Mail App"),
        content: const Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
