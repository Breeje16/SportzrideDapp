import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/journeys/wallet/widgets/fade_animation.dart';

// ignore: must_be_immutable
class IconsWidget extends StatelessWidget {
  late String title;
  late Widget child;
  late double delayanimation;
  late Color color;

  IconsWidget(
      {Key? key,
      required this.title,
      required this.child,
      required this.color,
      required this.delayanimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
              delay: delayanimation,
              child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: color, // 0xFF17334E
                      borderRadius: BorderRadius.circular(40.r)),
                  child: child),
            ),
          ],
        ),
        SizedBox(
          height: he * 0.01,
        ),
        FadeAnimation(
            delay: delayanimation,
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            )),
      ],
    );
  }
}
