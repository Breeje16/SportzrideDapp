import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';
import 'package:sportzride/presentation/widget/polls.dart';

// ignore: must_be_immutable
class PollsCardWidget extends StatefulWidget {
  String teamURL;
  String name;
  String time;
  PollsCardWidget({
    Key? key,
    required this.teamURL,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PollsCardWidgetState createState() => _PollsCardWidgetState();
}

class _PollsCardWidgetState extends State<PollsCardWidget> {
  double option1 = 2.0;
  double option2 = 1.0;
  double option3 = 4.0;
  double option4 = 3.0;

  String user = "user@gmail.com";
  Map usersWhoVoted = {
    'test@gmail.com': 1,
    'deny@gmail.com': 3,
    'kent@gmail.com': 2,
    'xyz@gmail.com': 3
  };
  String creator = "admin@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            Polls(
              children: [
                // This cannot be less than 2, else will throw an exception
                Polls.options(title: 'Robin Uthappa', value: option1),
                Polls.options(title: 'Ambati Rayudu', value: option2),
                Polls.options(title: 'Devon Conway', value: option3),
                Polls.options(title: 'Mooen Ali', value: option4),
              ],
              question: const Text(
                'Who Should Open with Ruturaj Gaikwad for Us?',
                style: TextStyle(color: Colors.white),
              ),
              currentUser: user,
              creatorID: creator,
              voteData: usersWhoVoted,
              userChoice: usersWhoVoted[user],
              onVoteBackgroundColor: Colors.blue,
              leadingBackgroundColor: Colors.blue,
              backgroundColor: AppTheme.powder,
              onVote: (choice) {
                setState(() {
                  usersWhoVoted[user] = choice;
                });
                if (choice == 1) {
                  setState(() {
                    option1 += 1.0;
                  });
                }
                if (choice == 2) {
                  setState(() {
                    option2 += 1.0;
                  });
                }
                if (choice == 3) {
                  setState(() {
                    option3 += 1.0;
                  });
                }
                if (choice == 4) {
                  setState(() {
                    option4 += 1.0;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
