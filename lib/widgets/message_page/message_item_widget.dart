import 'package:flutter/material.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/models/message_model.dart';

class MessageItemWidget extends StatelessWidget {
  const MessageItemWidget({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (message.sender != currentUser)
          UserIcon(
              size: 40,
              level: null,
              color: Colors.green,
              imagePath: message.sender.imageUrl),
        Container(
          margin: message.sender == currentUser
              ? EdgeInsets.only(top: 8, left: 100, bottom: 8)
              : EdgeInsets.only(top: 8, right: 8, bottom: 8),
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: message.sender == currentUser
                  ? Theme.of(context).primaryColor.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3)),
          child: Text(
            message.text,
            style: message.sender == currentUser
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}