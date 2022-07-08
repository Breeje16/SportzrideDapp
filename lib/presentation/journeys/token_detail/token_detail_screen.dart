import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/journeys/explore/benefits_widget.dart';
import 'package:sportzride/presentation/journeys/explore/games_and_reward_widget.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class TokenDetailScreen extends StatefulWidget {
  const TokenDetailScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TokenDetailScreenState createState() => _TokenDetailScreenState();
}

class _TokenDetailScreenState extends State<TokenDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppTheme.bgMain,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // background image and bottom contents
            Column(
              children: <Widget>[
                Container(
                  height: 200.h,
                  color: Colors.orange,
                  child: Center(
                    child: Image.asset(
                      "assets/icons/csk_team.png",
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 48.h),
                    Center(
                      child: Text(
                        'Chennai Super Kings',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      height: 50.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: AppTheme.linear1,
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "CSK/SZR: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          Text(
                            "2.25",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const GamesAndRewardWidget(),
                    const BenefitsWidget(),
                  ],
                )
              ],
            ),
            // Profile image
            Positioned(
              top: 150.0, // (background container size) - (circle height / 2)
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/icons/csk.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/icons/buysell.png"),
          ),
        ),
      ),
    );
  }
}
