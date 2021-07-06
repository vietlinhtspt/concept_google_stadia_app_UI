import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/pages/communication_page.dart';
import 'package:stadia_app/pages/home_page.dart';
import 'package:stadia_app/pages/store_page.dart';
import 'package:stadia_app/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Stadia App Concept',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: MainPage(),
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
