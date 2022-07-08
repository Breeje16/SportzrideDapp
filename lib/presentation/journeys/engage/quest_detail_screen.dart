import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class QuestDetailScreen extends StatefulWidget {
  String imgURL;
  QuestDetailScreen({required this.imgURL, Key? key}) : super(key: key);

  @override
  State<QuestDetailScreen> createState() => _QuestDetailScreenState();
}

class _QuestDetailScreenState extends State<QuestDetailScreen> {
  List<String> content = [
    'Contest Title',
    'Contest Organizers',
    'Rewards Up for Grabs',
    'Contest Description'
  ];
  //temp
  List<Widget> _buildList() {
    List<Widget> listItems = [];
    for (int i = 0; i < 10; i++) {
      if (i < 4) {
        listItems.add(
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Card(
                color: Colors.grey.shade800,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    content[i],
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.blue.shade200,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        listItems.add(
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Card(
                color: Colors.grey.shade800,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Card ${i.toString()}',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.blue.shade200,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppTheme.bgMain,
              pinned: true,
              stretch: true,
              title: const Text(
                'CSK Contest!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              expandedHeight: 300.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  widget.imgURL,
                  fit: BoxFit.cover,
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_buildList()),
            ),
          ],
        ),
      ),
    );
  }
}
