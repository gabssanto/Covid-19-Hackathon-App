import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;
  BackAppBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 30,
                  onPressed: () {
                    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                    Navigator.pop(context);
                  },
                  color: Color(0xff27b3ff)),
              Container(
                child: Text('$title',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff27b3ff))),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 30,
                disabledColor: Color(0x00ffffff),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
