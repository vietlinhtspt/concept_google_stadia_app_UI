import 'package:flutter/material.dart';

class HoursPlayedTile extends StatelessWidget {
  const HoursPlayedTile({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      width: screenWidth,
      child: Material(
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "HOURS PLAYED",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
              TextSpan(text: "\n"),
              TextSpan(
                  text: "297 Hours",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 35,
                    height: 1.5,
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
