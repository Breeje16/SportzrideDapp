// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class BenefitsWidget extends StatefulWidget {
  const BenefitsWidget({Key? key}) : super(key: key);

  @override
  _BenefitsWidgetState createState() => _BenefitsWidgetState();
}

class _BenefitsWidgetState extends State<BenefitsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.bgMain,
            AppTheme.bgMain,
            AppTheme.bgMain,
            AppTheme.bgMain,
            AppTheme.bgMain,
            AppTheme.bgMain,
            AppTheme.red,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Text(
              'Benefits',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                height: 135.h,
                width: 220.w,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/category/benefit$index.png',
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
