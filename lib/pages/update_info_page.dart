import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/gradient_button.dart';
import 'package:stadia_app/commons/text_field_custom.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/user_info_cubit.dart';
import 'package:stadia_app/states/user_info_state.dart';
import 'package:stadia_app/theme/colors.dart';

class UpdateInfoPage extends StatefulWidget {
  const UpdateInfoPage({Key key}) : super(key: key);

  @override
  _UpdateInfoPageState createState() => _UpdateInfoPageState();
}

class _UpdateInfoPageState extends State<UpdateInfoPage> {
  UserInfoCubit userInfoCubit;
  final TextEditingController _emailEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    this.userInfoCubit = BlocProvider.of<UserInfoCubit>(context);
    _emailEditingController.addListener(() {
      // print(this._emailEditingController.text);
      userInfoCubit.userNameChanged(this._emailEditingController.text.trim());
    });
  }

  void _submit() {
    this.userInfoCubit.submitUserName(this._emailEditingController.text.trim());
  }

  bool _enableSubmitButton(UserInfoStateSuccess userInfoStateSuccess) {
    print(userInfoStateSuccess.isValidUserName);
    return userInfoStateSuccess.isValidUserName;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, userInfoState) {
        return Scaffold(
          body: Column(
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
              Center(
                child: TextFieldCustom(
                  passwordController: _emailEditingController,
                  // isValidInput: loginState.isValidEmail,
                  labelText: 'Enter your nick name',
                ),
              ),
              if (userInfoState is UserInfoStateSuccess)
                GradientButton(
                  text: "START",
                  gradient: this._enableSubmitButton(userInfoState)
                      ? appGradient
                      : notEnalbleAppGradient,
                  onTap: () {
                    this._submit();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
