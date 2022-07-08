// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 6.w,
                          height: 6.h,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? AppTheme.red
                                : AppTheme.powder,
                            // Colors.white.withOpacity(
                            //     _current == entry.key ? 0.9 : 0.4)),
                          ),
                        ));
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'assets/images/category/sample1.png',
  'assets/images/category/sample2.png',
  'assets/images/category/sample3.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => ClipRRect(
            // borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 30.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                // padding: EdgeInsets.symmetric(
                //     vertical: 10.0, horizontal: 20.0),
                child: SizedBox(
                  height: 12.h,
                ),
              ),
            ),
          ],
        )))
    .toList();
