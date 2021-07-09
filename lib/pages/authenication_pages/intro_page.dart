import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Hero(
                  tag: "stadia_logo_with_name",
                  child: Image.asset(
                    stadia_logo_with_name,
                    // height: 150,
                  ),
                ),
              ),
            ),
            Image.asset(
              google_logo,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
