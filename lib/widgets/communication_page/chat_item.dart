import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/user_info_cubit.dart';
import 'package:stadia_app/pages/message_page.dart';
import 'package:stadia_app/states/user_info_state.dart';

class ChatItemWidget extends StatelessWidget {
  final QueryDocumentSnapshot snapshot;
  const ChatItemWidget(
    this.snapshot, {
    Key key,
  }) : super(key: key);

  Widget formatTimeData() {
    final String timestampSnapshot = snapshot.data()["timestamp"];

    final DateTime snapshotDatetime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestampSnapshot));
    final int diffInHours = DateTime.now().difference(snapshotDatetime).inHours;
    if (diffInHours < 24) {
      return Text(
          "${snapshotDatetime.hour}:${snapshotDatetime.minute.toString().padLeft(2, "0")}");
    } else {
      return Column(
        children: [
          Text(
            "JUL",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Text("01", style: TextStyle(color: Colors.grey, fontSize: 20))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MessagePage(this.snapshot)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // UserIcon(
              //     size: 60,
              //     level: null,
              //     color: Colors.green,
              //     imagePath: player1),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.snapshot.data()["name"],
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<UserInfoCubit, UserInfoState>(
                      builder: (context, userInfoState) {
                        if (userInfoState is UserInfoStateSuccess)
                          return Text(
                              "${this.snapshot.data()["userID"] == userInfoState.userDocumentSnapshot[0].data()["id"] ? "You" : "Other user"}: ${this.snapshot.data()["content"]}");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: formatTimeData(),
          )
        ],
      ),
    );
  }
}
