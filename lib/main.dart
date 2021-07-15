import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/cubits/authentication_cubit.dart';
import 'package:stadia_app/cubits/communication_cubit.dart';
import 'package:stadia_app/cubits/forgot_password_cubit.dart';
import 'package:stadia_app/cubits/login_cubit.dart';
import 'package:stadia_app/cubits/searching_cubit.dart';
import 'package:stadia_app/cubits/sign_up_cubit.dart';
import 'package:stadia_app/cubits/user_info_cubit.dart';
import 'package:stadia_app/pages/authenication_pages/authentication_pages.dart';
import 'package:stadia_app/pages/communication_page.dart';
import 'package:stadia_app/pages/error_page.dart';
import 'package:stadia_app/pages/home_page.dart';
import 'package:stadia_app/pages/init_page.dart';
import 'package:stadia_app/pages/splash.dart';
import 'package:stadia_app/pages/store_page.dart';
import 'package:stadia_app/pages/update_info_page.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/authentication_state.dart';
import 'package:stadia_app/states/user_info_state.dart';
import 'package:stadia_app/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AuthenticationService authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) =>
              AuthenticationCubit(authenticationService)..checkLoggedIn(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(authenticationService),
        ),
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(authenticationService)),
        BlocProvider<ForgotPasswordCubit>(
            create: (context) => ForgotPasswordCubit(authenticationService)),
        BlocProvider<UserInfoCubit>(
          create: (context) => UserInfoCubit(authenticationService),
        ),
        BlocProvider(
          create: (context) => CommunicationCubit(authenticationService),
        ),
        BlocProvider(
          create: (context) => SearchingCubit(authenticationService),
        )
      ],
      child: MaterialApp(
          title: 'Google Stadia App Concept',
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          // home: MainPage(),

          home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, authenticationState) {
            print("New authentication state");
            if (authenticationState is AuthenticationStateSuccess) {
              print("Login sucess");
              BlocProvider.of<UserInfoCubit>(context).getUserInfo();
              // return MainPage();
              return BlocBuilder<UserInfoCubit, UserInfoState>(
                  builder: (context, userInfoState) {
                if (userInfoState is UserInfoStateLoading) return SplashPage();
                if (userInfoState is UserInfoStateSuccess) {
                  if (userInfoState.userDocumentSnapshot.isEmpty)
                    return UpdateInfoPage();
                  return MainPage();
                }
                if (userInfoState is UserInfoStateFailure) return ErrorPage();
                return InitialPage();
              });
            } else if (authenticationState is AuthenticationStateFailure) {
              print("Login failure");
              return AuthenticationPages();
            }
            return SplashPage();
          })),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedTabbarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        CommunicationPage(),
        StorePage(),
      ].elementAt(this.selectedTabbarIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(icon_home)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(icon_communication)),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(icon_store)),
            label: "Store",
          ),
        ],
        currentIndex: this.selectedTabbarIndex,
        onTap: (index) {
          setState(() {
            selectedTabbarIndex = index;
          });
        },
      ),
    );
  }
}
