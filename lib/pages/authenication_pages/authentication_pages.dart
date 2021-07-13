import 'package:flutter/material.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/authentication_cubit.dart';
import 'package:stadia_app/cubits/login_cubit.dart';
import 'package:stadia_app/pages/authenication_pages/forgot_password_page.dart';
import 'package:stadia_app/pages/authenication_pages/log_in_page.dart';
import 'package:stadia_app/pages/authenication_pages/sign_up_page.dart';
import 'package:stadia_app/states/login_state.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPages extends StatefulWidget {
  AuthenticationPages({
    Key key,
  }) : super(key: key);

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
                  child: Hero(
                    tag: "stadia_logo_with_name",
                    child: Image.asset(
                      stadia_logo_with_name,
                      height: 100,
                    ),
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
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, loginState) {
                  if (loginState.isSuccess) _onLoginSuccess();

                  return Column(
                    children: [
                      GradientButton(
                        text: "LOG IN WITH GOOGLE",
                        gradient: appGradient,
                        onTap: () {
                          // print("on tab");
                          BlocProvider.of<LoginCubit>(context)
                              .loginWithGoogle();
                        },
                      ),
                      GradientButton(
                        text: "LOG IN WITH FACEBOOK",
                        gradient: appGradient,
                        onTap: () {
                          // print("on tab");
                          BlocProvider.of<LoginCubit>(context)
                              .loginWithFacebook();
                        },
                      ),
                    ],
                  );
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

  void _onLoginSuccess() {
    BlocProvider.of<AuthenticationCubit>(context).logIn();
    BlocProvider.of<LoginCubit>(context).reset();
  }
}
