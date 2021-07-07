import 'package:flutter/material.dart';
import 'package:stadia_app/commons/user_icon.dart';

class UserInfoTile extends StatelessWidget {
  final double size;
  final String imagePath;
  final Color color;
  final int level;
  const UserInfoTile(
      {Key key,
      @required this.size,
      @required this.imagePath,
      @required this.color,
      this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserIcon(
            size: size,
            level: level,
            color: this.color,
            imagePath: this.imagePath),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hello",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 36,
                          color: Theme.of(context)
                              .textTheme
                              .headline5
                              .color
                              .withOpacity(0.8),
                        ),
                  ),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text: "Jon Snow",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 40,
                          color: Theme.of(context)
                              .textTheme
                              .headline5
                              .color
                              .withOpacity(0.8),
                        ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
