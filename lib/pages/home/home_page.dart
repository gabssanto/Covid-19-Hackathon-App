import 'dart:async';

import 'package:covid19/global/homePageAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/diagnosis/diagnosis_page.dart';
import 'package:covid19/pages/help/help_page.dart';
import 'package:covid19/pages/home/constants.dart';
import 'package:covid19/pages/home/widgets/item.dart';
import 'package:covid19/pages/news/news_page.dart';
import 'package:covid19/pages/tips/tips_page.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xffefefef),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      HomePageItem(
                        destPage: DiagnosisPage(),
                        name: "Diagnóstico",
                        description:
                            "Visualize os diagnósticos da sua auto avaliação",
                        icon: ConstantsHomePage.iconeDiagostico,
                      ),
                      HomePageItem(
                        destPage: NewsPage(),
                        name: "Notícias",
                        description:
                            "Leia as principais notícias de saúde que estão circulando no Brasil",
                        icon: ConstantsHomePage.iconeNoticias,
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    HomePageItem(
                      destPage: TipsPage(),
                      name: "Dicas",
                      description:
                          "Leia dicas de saúde para ajudar na prevenção do Coronavirus",
                      icon: ConstantsHomePage.iconeDicas,
                    ),
                    HomePageItem(
                      destPage: HelpPage(),
                      name: "Unidades Básicas de Saúde",
                      description:
                          "Encontre as unidade Básicas de saúde mais próximas de você",
                      icon: ConstantsHomePage.iconeAjuda,
                    ),
                  ],
                ),
                Container(padding: EdgeInsets.only(top: 20.0),)
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _funct();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => _funct());
  }

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

    handleLocations.setLocation(_locationData.latitude, _locationData.longitude,
        _locationData.accuracy);

    print('Latitude: ${_locationData.latitude}');
    print('Longitude: ${_locationData.longitude}');
    print('Accuracy: ${_locationData.accuracy}');
  }
}
