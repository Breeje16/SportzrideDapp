import 'package:flutter/material.dart';
import 'package:sportzride/presentation/journeys/engage/polls_card_widget.dart';

class PollsScreen extends StatefulWidget {
  const PollsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PollsScreenState createState() => _PollsScreenState();
}

class _PollsScreenState extends State<PollsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PollsCardWidget(
              name: 'Chennai Super Kings',
              teamURL: 'assets/icons/csk.png',
              time: '11:30 PM Feb 22'),
          PollsCardWidget(
              name: 'Punjab Kings',
              teamURL: 'assets/icons/pbks.png',
              time: '11:30 PM Feb 22'),
          PollsCardWidget(
              name: 'Rajasthan Royals',
              teamURL: 'assets/icons/rr.png',
              time: '11:30 PM Feb 22'),
        ],
      ),
    );
  }
}
