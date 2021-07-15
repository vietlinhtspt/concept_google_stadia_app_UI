import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/commons/icon_with_padding.dart';
import 'package:stadia_app/commons/user_icon.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/user_info_cubit.dart';
import 'package:stadia_app/states/user_info_state.dart';
import 'package:stadia_app/theme/colors.dart';

class MessagePageTabbarWidget extends StatelessWidget {
  const MessagePageTabbarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: appGradient),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserInfoCubit, UserInfoState>(
              builder: (context, userInfoState) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    UserIcon(
                        size: 50,
                        level: null,
                        color: Colors.green,
                        imagePath: player1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userInfoState is UserInfoStateSuccess
                              ? userInfoState.userDocumentSnapshot[0]
                                      ["userName"]
                                  .toString()
                              : "Error",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Online",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15,
                              ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    icon_home,
                    width: 30,
                    color: Colors.white,
                  ),
                ),
                IconWithPadding(
                  iconData: Icons.call,
                  edgeInsetsGeometry: EdgeInsets.all(8),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
