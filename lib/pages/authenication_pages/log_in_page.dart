import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/commons/text_field_custom.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/authentication_cubit.dart';
import 'package:stadia_app/cubits/login_cubit.dart';
import 'package:stadia_app/main.dart';
import 'package:stadia_app/pages/authenication_pages/authentication_pages.dart';
import 'package:stadia_app/pages/authenication_pages/forgot_password_page.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/login_state.dart';
import 'package:stadia_app/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginCubit loginCubit;
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginCubit = BlocProvider.of<LoginCubit>(context);

    _emailEditingController.addListener(() {
      // print(this._emailEditingController.text);
      loginCubit.emailChanged(this._emailEditingController.text);
    });
    _passwordController.addListener(() {
      loginCubit.passwordChanged(this._passwordController.text);
    });
  }

  bool isEnableLoginButton(LoginState loginState) {
    return loginState.isValidEmailAndPassword;
  }

  void _submit() {
    loginCubit.submit(
        this._emailEditingController.text, this._passwordController.text);
  }

  void clean_input() {
    this._emailEditingController.clear();
    this._passwordController.clear();
    BlocProvider.of<LoginCubit>(context).reset();
  }

  void on_login_success(BuildContext context) async {
    await BlocProvider.of<AuthenticationCubit>(context).logIn();
    clean_input();
    // await SchedulerBinding.instance.addPostFrameCallback((_) async {

    // });
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).viewInsets.bottom);

    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, loginState) {
            // if (loginState.isSuccess) {
            //   // print("Login success");

            //   // on_login_success(context);
            // }
            return Column(
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
                SizedBox(width: MediaQuery.of(context).size.width),
                loginState.isSubmiting
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          TextFieldCustom(
                            passwordController: _emailEditingController,
                            isValidInput: loginState.isValidEmail,
                            labelText: 'Email',
                          ),
                          TextFieldCustom(
                            passwordController: _passwordController,
                            isValidInput: loginState.isValidPassword,
                            obscureText: true,
                            labelText: 'Password',
                          ),
                        ],
                      ),
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  loginState.onFailure
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            loginState.errorText,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )
                      : SizedBox(),
                (() {
                  if (loginState.isSuccess) {
                    Future.delayed(Duration.zero, () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', ModalRoute.withName('/'));
                    });
                    on_login_success(context);
                  }

                  return SizedBox();
                }()),
                if (loginState.isSuccess)
                  MediaQuery.of(this.context).viewInsets.bottom == 0
                      ? SizedBox(
                          height: 100,
                        )
                      : SizedBox(),
                GradientButton(
                  text: "LOG IN",
                  gradient: this.isEnableLoginButton(loginState)
                      ? appGradient
                      : notEnalbleAppGradient,
                  onTap: () {
                    this._submit();
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
              ],
            );
          },
        ),
      ]),
    );
  }
}
