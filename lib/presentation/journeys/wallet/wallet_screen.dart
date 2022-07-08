import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/common/prefs.dart';
import 'package:sportzride/data/models/wallet_model.dart';
import 'package:sportzride/presentation/blocs/auth/auth_cubit.dart';
import 'package:sportzride/presentation/journeys/wallet/widgets/cards.dart';
import 'package:sportzride/presentation/journeys/wallet/widgets/fade_animation.dart';
import 'package:sportzride/presentation/journeys/wallet/widgets/history.dart';
import 'package:sportzride/presentation/journeys/wallet/widgets/icons_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  WalletModel loggedInUser = WalletModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("wallets")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = WalletModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: we,
            height: he,
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Hello,",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              loggedInUser.username.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 50.h,
                          width: 50.w,
                          margin: const EdgeInsets.only(left: 200, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF272A3F)),
                          child: const Icon(
                            Icons.person_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),

                Swipercard(
                  loggedInUser.username.toString(),
                  loggedInUser.publicKey.toString(),
                ), // cards ..
                // Icons custom button //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconsWidget(
                        title: "Top-Up",
                        color: const Color(0xFF17334E),
                        delayanimation: 1.5,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          color: Colors.blue,
                        )),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    IconsWidget(
                        title: "Receive",
                        color: const Color(0xFF411C2E),
                        delayanimation: 1.7,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.payments),
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    IconsWidget(
                        title: "Withdraw",
                        color: const Color(0xFF163333),
                        delayanimation: 1.9,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/icons8-cash-withdrawal-96.png",
                            width: we * 0.08,
                            height: we * 0.08,
                            color: Colors.green,
                          ),
                        )),
                    SizedBox(width: we * 0.03),
                    IconsWidget(
                        title: "Transactions",
                        color: const Color(0xFF32204D),
                        delayanimation: 2.1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.receipt),
                          color: Colors.purple,
                        )),
                    SizedBox(
                      width: we * 0.03,
                    ),
                    IconsWidget(
                        title: "NFTs",
                        color: const Color(0xFF412D27),
                        delayanimation: 2.3,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/icons8-voucher-96.png",
                            width: we * 0.08,
                            height: he * 0.08,
                            color: Colors.orange,
                          ),
                          color: Colors.purple,
                        )),
                  ],
                ),
                SizedBox(
                  height: he * 0.05,
                ),

                // histories from wallet  ..  //
                Historywallet(
                    images: "assets/icons/csk.png",
                    title: "CSK Coin",
                    day: "21Jun 2021",
                    postiveornagtive: "-",
                    money: "11.90",
                    time: "12:01 am"),
                SizedBox(
                  height: he * 0.02,
                ),
                Historywallet(
                    images: "assets/icons/rcb.png",
                    title: "RCB Coin",
                    day: "20Jun 2021",
                    postiveornagtive: "+",
                    money: "63.00",
                    time: "09:00 pm"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
