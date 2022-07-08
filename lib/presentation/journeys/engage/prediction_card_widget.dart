import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';
import 'package:sportzride/presentation/widget/polls.dart';

class PredictionCardWidget extends StatefulWidget {
  const PredictionCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PredictionCardWidgetState createState() => _PredictionCardWidgetState();
}

class _PredictionCardWidgetState extends State<PredictionCardWidget> {
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
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 5.h, top: 6.h),
                child: const Text(
                  "Sportzride",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "11:15 PM Feb 22",
                    style: TextStyle(
                        color: AppTheme.powder,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp),
                  ),
                ],
              ),
            ),
            Polls(
              children: [
                // This cannot be less than 2, else will throw an exception
                Polls.options(title: 'KL Rahul', value: option1),
                Polls.options(title: 'Virat Kohli', value: option2),
                Polls.options(title: 'Ruturaj Gaikwad', value: option3),
                Polls.options(title: 'Rohit Sharma', value: option4),
              ],
              question: const Text(
                'Who will Win Orange Cap in IPL2022?',
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
