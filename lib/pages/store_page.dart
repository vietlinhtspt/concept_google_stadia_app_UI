import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stadia_app/constants/image_assert.dart';
import 'package:stadia_app/widgets/store_page/game_store_widget.dart';
import 'package:stadia_app/widgets/store_page/google_store_widget.dart';
import 'package:stadia_app/widgets/store_page/stadia_store_widget.dart';
import 'package:stadia_app/widgets/store_page/store_tab_label_widget.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  TabController _tabController;
  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Image.asset(
              stadia_logo_with_name,
              width: 30,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Hero(
              tag: "searching_icon",
              child: Image.asset(icon_search,
                  width: 23,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Hero(
              tag: "store_icon",
              child: Image.asset(icon_store,
                  width: 30,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Hero(
              tag: "menu_icon",
              child: Image.asset(icon_menu,
                  width: 30,
                  color: Theme.of(context).textTheme.bodyText1.color),
            ),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          TabBar(
            controller: this._tabController,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                child: StoreTabLabel(
                    index: 0,
                    label: "SHOP STADIA",
                    tabController: _tabController),
              ),
              Tab(
                child: StoreTabLabel(
                    index: 1,
                    label: "SHOP GAME",
                    tabController: _tabController),
              ),
              Tab(
                child: StoreTabLabel(
                    index: 2,
                    label: "SHOP GOOGLE",
                    tabController: _tabController),
              )
            ],
          ),
          // SearchProductWidget(),
          [
            ShopStadiaWidget(),
            ShopGameWidget(),
            ShopGoogleWidget(),
          ].elementAt(this._tabController.index)
        ],
      ),
    );
  }
}
