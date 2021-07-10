import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/commons/text_field_custom.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/login_cubit.dart';
import 'package:stadia_app/pages/authenication_pages/log_in_page.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/cubits/sign_up_cubit.dart';
import 'package:stadia_app/states/sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignUpCubit signUpCubit;

  @override
  void initState() {
    super.initState();
    signUpCubit = BlocProvider.of<SignUpCubit>(context);
    _emailEditingController.addListener(() {
      signUpCubit.emailChanged(this._emailEditingController.text);
    });
    _passwordController.addListener(() {
      signUpCubit.passwordChanged(this._passwordController.text);
    });
    _confirmPasswordController.addListener(() {
      signUpCubit.confirmPasswordChanged(this._confirmPasswordController.text);
    });
  }

  bool isEnableSignUpButton(SignUpState signUpState) {
    return signUpState.isValidEmailAndPassword;
  }

  void _submitEmailAndPassword() async {
    print("Submit in Page");
    signUpCubit.submit(
        this._emailEditingController.text, this._passwordController.text);
  }

  void cleanInput() {
    this._emailEditingController.clear();
    this._passwordController.clear();
    this._confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, signUpState) {
        // print(this._emailEditingController.text);
        // print(this._passwordController.text);
        // print(this._confirmPasswordController.text);
        return Scaffold(
          appBar: AppBar(),
          body: Stack(children: [
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
                SizedBox(width: MediaQuery.of(context).size.width),
                // TextFieldCustom(
                //   passwordController: _emailEditingController,
                //   labelText: 'Email',
                // ),
                // TextFieldCustom(
                //   passwordController: _passwordController,
                //   labelText: 'Password',
                // ),
                // TextFieldCustom(
                //   passwordController: _passwordController,
                //   labelText: 'Confirm password',
                // ),
                signUpState.isSubmiting
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          TextFieldCustom(
                            passwordController: _emailEditingController,
                            isValidInput: signUpState.isValidEmail,
                            labelText: 'Email',
                          ),
                          TextFieldCustom(
                            passwordController: _passwordController,
                            obscureText: true,
                            isValidInput: signUpState.isValidPassword,
                            labelText: 'Password',
                          ),
                          TextFieldCustom(
                            passwordController: _confirmPasswordController,
                            obscureText: true,
                            isValidInput: signUpState.isValidConfirmPassword,
                            labelText: 'Confirm password',
                          ),
                        ],
                      ),
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  signUpState.onFailure
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            signUpState.errorText,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )
                      : signUpState.isSuccess
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Create your account successfully, ",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                    text: "try login now?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  )
                                ]),
                                // style: Theme.of(context).textTheme.headline6,
                              ),
                            )
                          : SizedBox(),
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  SizedBox(
                    height: 100,
                  ),
                GradientButton(
                  text: "SIGN UP",
                  gradient: this.isEnableSignUpButton(signUpState)
                      ? secondAppGradient
                      : notEnalbleAppGradient,
                  onTap: () {
                    // // print("on tab");
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SignUpPage()));
                    this.isEnableSignUpButton(signUpState)
                        ? _submitEmailAndPassword()
                        : null;
                  },
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
