import 'package:flutter/material.dart';
import 'package:stadia_app/commons/header_tile.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/widgets/home_page/continue_playing_widget.dart';
import 'package:stadia_app/widgets/home_page/new_game_widget.dart';
import 'package:stadia_app/widgets/home_page/popularWithFriendWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 5,
        child: Stack(
          children: [
            Image.asset(
              game_sekiro_cover,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
            NewGameWidget(),
          ],
        ),
      ),
      Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              HeaderTitle(title: "Popular with friends"),
              SizedBox(
                height: 12,
              ),
              PopularWithFriendWidget()
            ],
          )),
      Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderTitle(title: "Continue playing"),
              SizedBox(
                height: 15,
              ),
              ContinuePlayingWidget()
            ],
          )),
    ]);
  }
}
