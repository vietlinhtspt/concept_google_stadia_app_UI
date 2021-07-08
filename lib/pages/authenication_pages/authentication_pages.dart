import 'package:flutter/material.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/pages/authenication_pages/forgot_password_page.dart';
import 'package:stadia_app/pages/authenication_pages/log_in_page.dart';
import 'package:stadia_app/pages/authenication_pages/sign_up_page.dart';
import 'package:stadia_app/theme/colors.dart';

class AuthenticationPages extends StatefulWidget {
  const AuthenticationPages({Key key}) : super(key: key);

  @override
  _AuthenticationPagesState createState() => _AuthenticationPagesState();
}

class _AuthenticationPagesState extends State<AuthenticationPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Image.asset(
                    stadia_logo_with_name,
                    height: 100,
                  ),
                ),
              ),
              GradientButton(
                text: "LOG IN",
                onTap: () {
                  // print("on tab");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              GradientButton(
                text: "SIGN UP",
                gradient: secondAppGradient,
                onTap: () {
                  // print("on tab");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
              ),
              GradientButton(
                text: "FORGOT PASSWORD",
                gradient: yellowAppGradient,
                onTap: () {
                  // print("on tab");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
              ),
              Text(
                "Or",
                style: Theme.of(context).textTheme.headline6,
              ),
              GradientButton(
                text: "INCOGNITO MODE",
                gradient: greyAppGradient,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
