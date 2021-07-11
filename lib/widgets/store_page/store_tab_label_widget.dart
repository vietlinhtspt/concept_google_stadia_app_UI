import 'package:flutter/material.dart';

class StoreTabLabel extends StatelessWidget {
  final int index;
  final String label;
  const StoreTabLabel({
    Key key,
    @required this.label,
    @required this.index,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.label,
      style: _tabController.index == this.index
          ? Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 13, fontWeight: FontWeight.bold)
              .apply(color: Theme.of(context).primaryColor)
          : Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
