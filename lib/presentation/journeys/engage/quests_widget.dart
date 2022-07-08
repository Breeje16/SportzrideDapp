import 'package:flutter/material.dart';
import 'package:sportzride/presentation/journeys/engage/feed_card_widget.dart';
import 'package:sportzride/presentation/journeys/engage/quests_tabs_widget.dart';
import 'package:sportzride/presentation/journeys/engage/top_image_widget.dart';

class QuestsWidget extends StatefulWidget {
  const QuestsWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuestsWidgetState createState() => _QuestsWidgetState();
}

class _QuestsWidgetState extends State<QuestsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FeedCardWidget(
            name: 'Chennai Super Kings',
            imageURL: 'assets/icons/csk_team.png',
            description: 'What will be out Best Playing XI From this Squad?',
            teamURL: 'assets/icons/csk.png',
            time: '11:30 PM Feb 22',
          ),
          FeedCardWidget(
              name: 'Royal Challengers Banglore',
              imageURL: 'assets/icons/rcb_team.png',
              description: 'What will be out Best Playing XI From this Squad?',
              teamURL: 'assets/icons/rcb.png',
              time: '11:15 PM Feb 22'),
          FeedCardWidget(
              name: 'Mumbai Indians',
              imageURL: 'assets/icons/mi_team.png',
              description: 'What will be out Best Playing XI From this Squad?',
              teamURL: 'assets/icons/mi.png',
              time: '11:00 PM Feb 22'),
          FeedCardWidget(
              name: 'Kolkata Knight Riders',
              imageURL: 'assets/icons/kkr_team.png',
              description: 'What will be out Best Playing XI From this Squad?',
              teamURL: 'assets/icons/kkr.png',
              time: '10:30 PM Feb 22'),
        ],
      ),
    );

    // return SingleChildScrollView(
    //   child: Column(
    //     children: const [
    //       TopImageWidget(),
    //       QuestTabWidget(),
    //     ],
    //   ),
    // );
  }
}
