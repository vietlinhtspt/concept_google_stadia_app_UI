import 'package:flutter/material.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:stadia_app/widgets/home_page/app_bar.dart';

class NewGameWidget extends StatelessWidget {
  const NewGameWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarCustom(),
          Column(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "NEW GAME",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    TextSpan(text: "\n"),
                    TextSpan(
                        text: "Sekiro: Shadows Die Twice",
                        style: TextStyle(
                            color: Colors.white.withOpacity(1),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.5))
                  ])),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                decoration: BoxDecoration(
                    gradient: appGradient,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Play",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
