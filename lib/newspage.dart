import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notícias'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Center(
              child: Text('stub'),
            )
          ],
        ));
  }
}
