import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    final screenHeight = MediaQuery.of(context).size.width;
    final logoSize = screenHeight * 0.4;
    return SafeArea(
      child: Stack(
        children: [
          Transform.translate(
            offset: new Offset(screenWidth * 0.35, 0),
            child: Transform.rotate(
                angle: -0.1,
                child: new SvgPicture.asset(
                  logo,
                  height: logoSize,
                  color: logoTintColor,
                  semanticsLabel: "Logo",
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ImageIcon(
                        AssetImage(icon_menu),
                        color: Theme.of(context).iconTheme.color,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                    ),
                    Container(
                      child: ImageIcon(
                        AssetImage(icon_search),
                        color: Theme.of(context).iconTheme.color,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                        height: 97,
                        width: 97,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(player1),
                        ),
                      ),
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
                                "39",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Hello",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                    fontSize: 36,
                                  ),
                            ),
                            TextSpan(text: "\n"),
                            TextSpan(
                              text: "Jon Snow",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontSize: 40),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
