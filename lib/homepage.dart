import 'dart:async';

import 'package:covid19/global/homePageAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/newspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';

import 'HelpPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;

  _funct() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }

    _locationData = await location.getLocation();
    
    handleLocations.setLocation(_locationData.latitude, _locationData.longitude, _locationData.accuracy);
    
    print('Latitude: ${_locationData.latitude}');
    print('Longitude: ${_locationData.longitude}');
    print('Accuracy: ${_locationData.accuracy}');
  }

  @override
  void initState() {
    super.initState();
    _funct();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => _funct());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xffefefef),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 143,
                  height: 153,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(Icons.favorite, size: 60, color: Color(0xff27b3ff),)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Diagnostico",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff707070),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.132,
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 143,
                  height: 153,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NewsPage()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Icon(Icons.note, size: 60, color: Color(0xff27b3ff),)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Notícias",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xff707070),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                letterSpacing: -0.132,
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 143,
                  height: 153,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Icon(Icons.lightbulb_outline, size: 60, color: Color(0xff27b3ff),)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Dicas",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xff707070),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.132,
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 143,
                  height: 153,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HelpPage()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Icon(Icons.help, size: 60, color: Color(0xff27b3ff),)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Ajuda",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xff707070),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                letterSpacing: -0.132,
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
