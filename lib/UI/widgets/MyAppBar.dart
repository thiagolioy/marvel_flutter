import 'package:flutter/material.dart';

abstract class MyAppBarDelegate {
  void didClickGridIcon();

  void didClickListIcon();
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MyAppBarDelegate delegate;

  MyAppBar(this.delegate);

  void switchToGrid() {
    delegate.didClickGridIcon();
  }

  void switchToList() {
    delegate.didClickListIcon();
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Characters"),
      actions: <Widget>[
        FlatButton(
          onPressed: switchToGrid,
          child: Image.asset(
            "assets/images/grid_icon.png",
            width: 22,
            height: 22,
          ),
        ),
        FlatButton(
          onPressed: switchToList,
          child: Image.asset(
            "assets/images/list_icon.png",
            width: 22,
            height: 22,
          ),
        ),
      ],
    );
  }
}
