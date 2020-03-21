import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;
  GeneralAppBar(
      {@required this.title,
        @required this.child,
        @required this.onPressed,
        this.onTitleTapped})
      : preferredSize = Size.fromHeight(85.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 0, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xff27b3ff)),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child:  Text('$title',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff27b3ff))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
