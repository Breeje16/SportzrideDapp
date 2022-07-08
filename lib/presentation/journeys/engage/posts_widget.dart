import 'package:flutter/material.dart';
import 'package:sportzride/presentation/journeys/engage/feed_card_widget.dart';

class PostsWidget extends StatefulWidget {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostsWidgetState createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FeedCardWidget(
              name: 'Chennai Super Kings',
              imageURL: 'assets/icons/csk_team.png',
              description:
                  'Here\'s the Final Squad of Chennai Super Kings for IPL 2022!',
              teamURL: 'assets/icons/csk.png',
              time: '11:30 PM Feb 22'),
          FeedCardWidget(
              name: 'Royal Challengers Banglore',
              imageURL: 'assets/icons/rcb_team.png',
              description:
                  'Here\'s the Final Squad of Royal Challengers Banglore for IPL 2022!',
              teamURL: 'assets/icons/rcb.png',
              time: '11:15 PM Feb 22'),
          FeedCardWidget(
              name: 'Mumbai Indians',
              imageURL: 'assets/icons/mi_team.png',
              description:
                  'Here\'s the Final Squad of Mumbai Indians for IPL 2022!',
              teamURL: 'assets/icons/mi.png',
              time: '11:00 PM Feb 22'),
          FeedCardWidget(
              name: 'Kolkata Knight Riders',
              imageURL: 'assets/icons/kkr_team.png',
              description:
                  'Here\'s the Final Squad of Kolkata Knight Riders for IPL 2022!',
              teamURL: 'assets/icons/kkr.png',
              time: '10:30 PM Feb 22'),
        ],
      ),
    );
  }
}
