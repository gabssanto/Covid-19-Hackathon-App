import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  final destPage;
  final String name;
  final String description;
  final String icon;

  HomePageItem({this.destPage, this.name, this.icon, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 3.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => destPage));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 7,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(icon),
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            Container(
                child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.132,
              ),
              textAlign: TextAlign.center,
            )),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xff707070),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.132,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
