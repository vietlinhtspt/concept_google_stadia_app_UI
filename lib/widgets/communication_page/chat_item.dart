import 'package:flutter/material.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/constants/image_assert.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            UserIcon(
                size: 60, level: null, color: Colors.green, imagePath: player1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Oliver",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text("You: Hello"),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Text(
                "JUL",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.grey),
              ),
              Text(
                "01",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
