import 'package:flutter/material.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/models/friends.dart';

class FriendsTile extends StatelessWidget {
  const FriendsTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var friend in friends)
            Container(
                child: UserIcon(
              size: 60,
              level: null,
              color: friend.isPlaying == true
                  ? Theme.of(context).primaryColor
                  : friend.isOnline
                      ? Colors.green
                      : Colors.grey,
              imagePath: friend.imagePath,
            ))
        ],
      ),
    );
  }
}