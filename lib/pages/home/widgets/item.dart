import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  final destPage;
  final String name;
  final String icon;

  HomePageItem({this.destPage, this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 143,
      height: 153,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => destPage));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(icon),
                ),
                borderRadius: BorderRadius.all(Radius.circular(35)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xff707070),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.132,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
