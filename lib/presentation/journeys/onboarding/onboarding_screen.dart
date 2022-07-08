import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sportzride/presentation/journeys/signup_signin/signup_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static open(context) => Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()));

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Buy Sportzride Token and Trade',
            body:
                'Buy Sportzride (\$SZR) Token with your Fiat Currency (INR). Use the \$SZR token to Buy Fan Tokens of any of your Favorite Teams.',
            image: buildImage('assets/images/onboarding/1.png'),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: 'Get your Voice Heard to Teams',
            body:
                'Buying the Fan Token of a Team gives you Access of Voting Rights, Get a Super Fan NFT Badge and Many more Benefits that the Team Provides.',
            image: buildImage('assets/images/onboarding/2.png'),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: 'Participate and Win Exclusive Prizes',
            body:
                'You will get a Chance to Participate and Win Exclusive Prizes or Experiences on Contests organised by Franchises and Sportzride.',
            image: buildImage('assets/images/onboarding/3.png'),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: 'Get Rewards and Benefits including Exclusive NFTs',
            body:
                'You will get Rewards and benefits in different form if you keep Holding the Fan Token for a Long time and Show Loyalty towards them.',
            image: buildImage('assets/images/onboarding/4.png'),
            decoration: pageDecoration(),
          ),
        ],
        done: const Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onDone: () => goToSignup(context),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
        showNextButton: true,
        dotsDecorator: DotsDecorator(
          color: AppTheme.grey500,
          activeColor: AppTheme.red,
          activeSize: Size(22.w, 10.h),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        next: const Icon(
          Icons.next_plan,
          color: Colors.white,
        ),
        animationDuration: 400,
      ),
    );
  }

  void goToSignup(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SignupScreen()),
          (route) => false);
    });
  }

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350.w,
        ),
      );

  PageDecoration pageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
        ),
        bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        pageColor: AppTheme.secondaryc,
      );
}
