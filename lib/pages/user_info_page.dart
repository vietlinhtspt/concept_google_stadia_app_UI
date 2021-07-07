import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/models/last_played_game.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:stadia_app/widgets/home_page/app_bar.dart';
import 'package:stadia_app/widgets/home_page/friends_tile.dart';
import 'package:stadia_app/commons/header_tile.dart';
import 'package:stadia_app/widgets/home_page/hours_played_tile.dart';
import 'package:stadia_app/commons/last_played_game_tile.dart';
import 'package:stadia_app/widgets/home_page/user_info_tile.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    final screenHeight = MediaQuery.of(context).size.width;
    final logoSize = screenHeight * 0.4;
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
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
                SizedBox(
                  height: 10,
                ),
                UserInfoTile(
                  size: 97,
                  imagePath: player1,
                  level: 39,
                  color: Theme.of(context).primaryColor,
                ),
                HoursPlayedTile(screenWidth: screenWidth),
                HeaderTitle(title: "Last Played games"),
                for (var playedGameItem in lastPlayedGames)
                  LastPlayedGameTile(
                      playedGameItem: playedGameItem, screenWidth: screenWidth),
                SizedBox(
                  height: 5,
                ),
                HeaderTitle(title: "Friends"),
                SizedBox(
                  height: 5,
                ),
                FriendsTile(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
