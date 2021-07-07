import 'package:flutter/material.dart';
import 'package:stadia_app/theme/colors.dart';

class UserIcon extends StatelessWidget {
  const UserIcon(
      {Key key,
      @required this.size,
      @required this.level,
      @required this.color,
      @required this.imagePath})
      : super(key: key);

  final double size;
  final int level;
  final Color color;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: this.size,
          width: this.size,
          child: CircleAvatar(
            backgroundColor: this.color,
          ),
        ),
        Container(
          height: this.size * 0.9,
          width: this.size * 0.9,
          child: CircleAvatar(
            backgroundImage: AssetImage(this.imagePath),
          ),
        ),
        if (this.level != null)
          Transform.translate(
            offset: Offset(40, 30),
            child: CircleAvatar(
              radius: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: appGradient,
                ),
                child: Center(
                  child: Text(
                    this.level.toString(),
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
