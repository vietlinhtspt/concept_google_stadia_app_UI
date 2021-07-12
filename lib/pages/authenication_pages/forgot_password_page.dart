import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/commons/text_field_custom.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/forgot_password_cubit.dart';
import 'package:stadia_app/states/forgot_password_state.dart';
import 'package:stadia_app/theme/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  ForgotPasswordCubit forgotPasswordCubit;

  @override
  void initState() {
    super.initState();
    forgotPasswordCubit = BlocProvider.of<ForgotPasswordCubit>(context);
    _emailEditingController.addListener(() {
      forgotPasswordCubit.emailChanged(this._emailEditingController.text);
    });
    // _passwordController.addListener(() {
    //   print(this._passwordController.text);
    // });
  }

  bool isValidEmail(ForgotPasswordState forgotPasswordState) {
    return forgotPasswordState.isValidEmail;
  }

  void sendResetPasswordEmail() {
    forgotPasswordCubit.resetPasswordByMail(this._emailEditingController.text);
  }

  void cleanInput() {
    this._emailEditingController.clear();
    this.forgotPasswordCubit.reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, forgotPasswordState) {
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
                  SizedBox(width: MediaQuery.of(context).size.width),
                  TextFieldCustom(
                      passwordController: _emailEditingController,
                      labelText: 'Email',
                      isValidInput: this.isValidEmail(forgotPasswordState)),
                  // TextFieldCustom(
                  //   passwordController: _passwordController,
                  //   labelText: 'New password',
                  // ),
                  // TextFieldCustom(
                  //   passwordController: _passwordController,
                  //   labelText: 'Confirm new password',
                  // ),
                  if (forgotPasswordState.onFailure)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        forgotPasswordState.errText ?? "",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  else if (forgotPasswordState.isSuccess)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "Sent the reseting password to your email. Please check your email and follow the instructions.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  MediaQuery.of(this.context).viewInsets.bottom == 0
                      ? SizedBox(
                          height: 100,
                        )
                      : SizedBox(),
                  if (forgotPasswordState.isSubmiting)
                    CircularProgressIndicator()
                  else if (isValidEmail(forgotPasswordState))
                    GradientButton(
                      text: "RESET MY PASSWORD",
                      gradient: yellowAppGradient,
                      onTap: () {
                        this.sendResetPasswordEmail();
                      },
                    )
                  else
                    GradientButton(
                        text: "RESET MY PASSWORD",
                        gradient: notEnalbleAppGradient),
                ],
              ),
            ]),
          ),
        );
      },
    );
  }
}
