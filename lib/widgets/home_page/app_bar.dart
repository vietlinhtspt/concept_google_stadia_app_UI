import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/pages/user_info_page.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white70)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserInfoPage()));
              },
              child: Container(
                child: ImageIcon(
                  AssetImage(icon_menu),
                  color: Colors.white70,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            Container(
              child: ImageIcon(
                AssetImage(icon_search),
                color: Colors.white70,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}
