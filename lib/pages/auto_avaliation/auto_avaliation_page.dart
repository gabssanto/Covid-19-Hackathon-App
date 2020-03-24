import 'package:covid19/global/generalAppBar.dart';
import 'package:covid19/pages/auto_avaliation/constants.dart';
import 'package:covid19/pages/auto_avaliation/widgets/form.dart';
import 'package:flutter/material.dart';

class AutoAvaliationPage1 extends StatefulWidget {
  @override
  _AutoAvaliationPage1State createState() => _AutoAvaliationPage1State();
}

class _AutoAvaliationPage1State extends State<AutoAvaliationPage1> {
  dynamic response;

  Map decorations = {};

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: GeneralAppBar(
        title: 'Autoavaliação',
      ),
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(children: <Widget>[
            AutoAvaliationForm(formPath: ConstantsAutoAvaliationPage.formPath),
          ]),
        ),
      ),
    );
  }
}
