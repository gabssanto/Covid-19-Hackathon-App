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
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
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
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('$title',
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
      ),
    );
  }
}
