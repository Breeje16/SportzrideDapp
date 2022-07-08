// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/journeys/explore/benefits_widget.dart';
import 'package:sportzride/presentation/journeys/explore/categories_widget.dart';
import 'package:sportzride/presentation/journeys/explore/games_and_reward_widget.dart';
import 'package:sportzride/presentation/journeys/explore/carousel_widget.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';
import 'package:sportzride/presentation/widget/sr_drawer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.secondaryc,
        centerTitle: true,
        title: Row(children: const [
          Text(
            "Sportz",
            style: TextStyle(fontWeight: FontWeight.w500, color: AppTheme.red),
          ),
          Text(
            "Ride",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppTheme.powder),
          ),
        ]),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const SRDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            CarouselWidget(),
            CategoriesWidget(),
            GamesAndRewardWidget(),
            BenefitsWidget(),
          ],
        ),
      ),
    );
  }
}
