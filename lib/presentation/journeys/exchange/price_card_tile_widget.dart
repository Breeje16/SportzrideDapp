import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/journeys/token_detail/token_detail_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

// ignore: must_be_immutable
class PriceCardTileWidget extends StatefulWidget {
  String coinName;
  String price;
  String growth;
  String logoURL;
  PriceCardTileWidget({
    Key? key,
    required this.coinName,
    required this.price,
    required this.growth,
    required this.logoURL,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PriceCardTileWidgetState createState() => _PriceCardTileWidgetState();
}

class _PriceCardTileWidgetState extends State<PriceCardTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TokenDetailScreen()));
        },
        child: Stack(
          children: [
            Positioned(
              right: 12.w,
              child: Container(
                height: 80.h,
                width: 319.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/subtract.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 32.w),
                  child: ListTile(
                    title: Padding(
                      padding:
                          EdgeInsets.only(left: 4.w, top: 6.h, bottom: 6.h),
                      child: Text(
                        widget.coinName,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                    ),
                    subtitle: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      child: Row(
                        children: [
                          Text(
                            widget.price,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppTheme.green),
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              widget.growth,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // right: 120.w,
              top: 20.h,
              left: 0.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36.r),
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset(
                    widget.logoURL,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
