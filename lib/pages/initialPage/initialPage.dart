import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19/global/locationInfo.dart';
import 'package:covid19/pages/login/login_page.dart';
import 'package:covid19/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPage createState() => _InitialPage();
}

class _InitialPage extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    globalLocation.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 40),
            child: SvgPicture.asset(
              'assets/logo-horizontal.svg',
              height: 67.5,
              width: 67.5,
              color: Color(0xff27b3ff),
            ),
          ),
          CarouselSlider(
            height: MediaQuery.of(context).size.height / 2.2,
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color(0xffe3e3e3),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Container(
            margin: const EdgeInsets.only(top: 45),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 15,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color(0xff27b3ff),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 15,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              borderSide: BorderSide(
                color: Color(0xff27b3ff),
              ),
              color: Color(0xff27b3ff),
              child: Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff27b3ff),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
