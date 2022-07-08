import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/common/prefs.dart';
import 'package:sportzride/presentation/blocs/auth/auth_cubit.dart';
import 'package:sportzride/presentation/journeys/home_screen.dart';
import 'package:sportzride/presentation/journeys/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthCubit authCubit;
  // bool? isNewUser;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      authCubit = BlocProvider.of<AuthCubit>(context);
      authCubit.userStatus();
      // isNewUser = await Prefs.getIsNewUser();
      // if (isNewUser == true) {
      //   OnboardingScreen.open(context);
      // }
      // HomeScreen.open(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        }
        if (state is AuthLogoutLoaded) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
              (route) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo here
              Image.asset(
                'assets/icons/sportzride.png',
                height: 120.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
