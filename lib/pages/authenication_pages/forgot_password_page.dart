import 'package:flutter/material.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/commons/text_field_custom.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/theme/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailEditingController.addListener(() {
      print(this._emailEditingController.text);
    });
    _passwordController.addListener(() {
      print(this._passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              TextFieldCustom(
                passwordController: _emailEditingController,
                labelText: 'Email',
              ),
              TextFieldCustom(
                passwordController: _passwordController,
                labelText: 'New password',
              ),
              TextFieldCustom(
                passwordController: _passwordController,
                labelText: 'Confirm new password',
              ),
              SizedBox(
                height: 100,
              ),
              GradientButton(
                text: "FORGOT PASSWORD",
                gradient: yellowAppGradient,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
