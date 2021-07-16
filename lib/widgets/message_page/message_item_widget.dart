import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/cubits/user_info_cubit.dart';
import 'package:stadia_app/models/message_model.dart';
import 'package:stadia_app/states/user_info_state.dart';

class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({
    Key key,
    @required this.message,
  }) : super(key: key);

  final QueryDocumentSnapshot message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, userInfoState) {
        if (userInfoState is UserInfoStateSuccess)
          return Row(
            children: [
              // if (message["fromUser"] != 124567)
              // UserIcon(
              //     size: 40,
              //     level: null,
              //     color: Colors.green,
              //     imagePath: message["fromUser"].imageUrl),
              Container(
                margin: message["fromUser"] ==
                        userInfoState.userDocumentSnapshot[0]["id"]
                    ? EdgeInsets.only(top: 8, left: 100, bottom: 8)
                    : EdgeInsets.only(top: 8, right: 8, bottom: 8),
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: message["fromUser"] ==
                            userInfoState.userDocumentSnapshot[0]["id"]
                        ? Theme.of(context).primaryColor.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.3)),
                child: Text(
                  message["content"],
                  style: message["fromUser"] ==
                          userInfoState.userDocumentSnapshot[0]["id"]
                      ? Theme.of(context).textTheme.bodyText1
                      : Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          );
      },
    );
  }
}
