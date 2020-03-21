import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;
  LoginAppBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(150.0);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xff27b3ff)),
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
