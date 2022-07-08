import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestTabWidget extends StatefulWidget {
  const QuestTabWidget({Key? key}) : super(key: key);

  @override
  State<QuestTabWidget> createState() => _QuestTabWidgetState();
}

class _QuestTabWidgetState extends State<QuestTabWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.grey[100],
          title: Container(
            color: Colors.grey[100],
            height: 200.h,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                "Head",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: const <Widget>[
              Icon(Icons.dashboard),
              Icon(Icons.tv),
              Icon(Icons.person),
            ],
          ),
        ),
        SliverAnimatedList(
          itemBuilder: (_, index, ___) {
            return ListTile(
              title: Text(index.toString()),
            );
          },
          initialItemCount: 10,
        ),
      ],
    );
  }
}
