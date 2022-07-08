import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/journeys/engage/quest_detail_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

// ignore: must_be_immutable
class FeedCardWidget extends StatefulWidget {
  String teamURL;
  String name;
  String time;
  String imageURL;
  String description;

  FeedCardWidget(
      {Key? key,
      required this.teamURL,
      required this.name,
      required this.time,
      required this.imageURL,
      required this.description})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FeedCardWidgetState createState() => _FeedCardWidgetState();
}

class _FeedCardWidgetState extends State<FeedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuestDetailScreen(
                    imgURL: widget.imageURL,
                  )))
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: AppTheme.label600,
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: CircleAvatar(
                    child: Image.asset(
                      widget.teamURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 5.h, top: 6.h),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.time,
                      style: TextStyle(
                          color: AppTheme.powder,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                    ),
                    Text(
                      'Powered By Sportzride',
                      style: TextStyle(
                          color: AppTheme.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Image.asset(widget.imageURL),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                      color: AppTheme.powder, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
