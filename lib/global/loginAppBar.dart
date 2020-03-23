import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;
  final bool canGoBack;

  @override
  final Size preferredSize;

  LoginAppBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.onTitleTapped,
      @required this.canGoBack})
      : preferredSize = Size.fromHeight(150.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: canGoBack ? 150 : 100,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                (() {
                  if (canGoBack) {
                    return IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30,
                        onPressed: () {
                          this.onPressed != null
                              ? this.onPressed()
                              : Navigator.pop(context);
                        },
                        color: Color(0xff27b3ff));
                  }
                  return Container(height: 0.0);
                })(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('$title',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff27b3ff))),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
