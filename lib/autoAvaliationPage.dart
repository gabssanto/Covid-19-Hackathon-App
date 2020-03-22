import 'dart:async';
import 'dart:io';

import 'package:covid19/global/generalAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

double height = 80.00;
class AutoAvaliationPage extends StatefulWidget {
  @override
  _AutoAvaliationPageState createState() => _AutoAvaliationPageState();
}

class _AutoAvaliationPageState extends State<AutoAvaliationPage> {
  var _height = 80.00;
  static const finalHeight = 1035.00;

  Duration _duration = new Duration(milliseconds: 500);

  Duration _durationButton = new Duration(milliseconds: 200);

  var _buttonYesColor = Color(0xffe8e8e8);

  var _buttonYesText = Colors.black38;

  var _buttonNoColor = Color(0xffe8e8e8);

  var _buttonNoText = Colors.black38;

  var _buttonYesColorY1 = Color(0xffe8e8e8);

  var _buttonYesTextY1 = Colors.black38;

  var _buttonNoColorY1 = Color(0xffe8e8e8);

  var _buttonNoTextY1 = Colors.black38;

  var _buttonYesColorN1 = Color(0xffe8e8e8);

  var _buttonYesTextN1 = Colors.black38;

  var _buttonNoColorN1 = Color(0xffe8e8e8);

  var _buttonNoTextN1 = Colors.black38;

  var _buttonYesColorN1a = Color(0xffe8e8e8);

  var _buttonYesTextN1a = Colors.black38;

  var _buttonNoColorN1a = Color(0xffe8e8e8);

  var _buttonNoTextN1a = Colors.black38;

  var _question1 = 0;
  var _question2 = 0;
  var _question3 = 0;
  var _question2Y1 = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'Autoavaliação',),
      body: Container(
              color: Color(0xffe8e8e8),
              child: ListView(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                      height: _height,
                      width: MediaQuery.of(context).size.width,
                      //duration: _duration,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Você já teve diagnóstico de coronavírus?",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.154,
                                )
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              AnimatedContainer(
                                duration: _durationButton,
                                margin: EdgeInsets.only(top: 10),
                                width: 144,
                                height: 35,
                                decoration: new BoxDecoration(
                                    color: _buttonYesColor,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _height = 225.00;
                                      _question1 = 1;
                                      _buttonYesColor = Color(0xff27b3ff);
                                      _buttonYesText = Colors.white;
                                      _buttonNoColor = Color(0xffe8e8e8);
                                      _buttonNoText = Colors.black38;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Sim",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: _buttonYesText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: -0.154,

                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 144,
                                height: 35,
                                decoration: new BoxDecoration(
                                    color: _buttonNoColor,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _height = 225.00;
                                      _question1 = 2;
                                      _buttonYesColor = Color(0xffe8e8e8);
                                      _buttonYesText = Colors.black38;
                                      _buttonNoColor = Color(0xff27b3ff);
                                      _buttonNoText = Colors.white;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Não",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: _buttonNoText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: -0.154,

                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          _question1 == 1 ?
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text("Quando foi diagnosticado?",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.154,

                                        )
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width - 65,
                                      height: 35,
                                      decoration: new BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffe8e8e8),
                                              width: 1
                                          ),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text("14/03/2020",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black38,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: -0.154,

                                              )
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text("Está em isolamento residencial ou internamento?",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.154,

                                        )
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      AnimatedContainer(
                                        duration: _durationButton,
                                        margin: EdgeInsets.only(top: 10),
                                        width: 144,
                                        height: 35,
                                        decoration: new BoxDecoration(
                                            color: _buttonYesColorY1,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _question2Y1 = 1;
                                              _buttonYesColorY1 = Color(0xff27b3ff);
                                              _buttonYesTextY1 = Colors.white;
                                              _buttonNoColorY1 = Color(0xffe8e8e8);
                                              _buttonNoTextY1 = Colors.black38;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Sim",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: _buttonYesTextY1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,

                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        width: 144,
                                        height: 35,
                                        decoration: new BoxDecoration(
                                            color: _buttonNoColorY1,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _question2Y1 = 2;
                                              _buttonYesColorY1 = Color(0xffe8e8e8);
                                              _buttonYesTextY1 = Colors.black38;
                                              _buttonNoColorY1 = Color(0xff27b3ff);
                                              _buttonNoTextY1 = Colors.white;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Não",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: _buttonNoTextY1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,

                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                              :
                              _question1 == 2?
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text("Você é um caso suspeito de coronavírus?",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.154,

                                        )
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      AnimatedContainer(
                                        duration: _durationButton,
                                        margin: EdgeInsets.only(top: 10),
                                        width: 144,
                                        height: 35,
                                        decoration: new BoxDecoration(
                                            color: _buttonYesColorN1,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _height = 225.00;
                                              _question2 = 1;
                                              _buttonYesColorN1 = Color(0xff27b3ff);
                                              _buttonYesTextN1 = Colors.white;
                                              _buttonNoColorN1 = Color(0xffe8e8e8);
                                              _buttonNoTextN1 = Colors.black38;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Sim",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: _buttonYesTextN1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        width: 144,
                                        height: 35,
                                        decoration: new BoxDecoration(
                                            color: _buttonNoColorN1,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _height = finalHeight;
                                              _question2 = 2;
                                              _buttonYesColorN1 = Color(0xffe8e8e8);
                                              _buttonYesTextN1 = Colors.black38;
                                              _buttonNoColorN1 = Color(0xff27b3ff);
                                              _buttonNoTextN1 = Colors.white;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Não",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: _buttonNoTextN1,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text("Está em isolamento residencial ou internamento?",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.154,

                                        )
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      AnimatedContainer(
                                        duration: _durationButton,
                                        margin: EdgeInsets.only(top: 10),
                                        width: 144,
                                        height: 35,
                                        decoration: new BoxDecoration(
                                            color: _buttonYesColorN1a,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _height = 225.00;
                                              _question3 = 1;
                                              _buttonYesColorN1a = Color(0xff27b3ff);
                                              _buttonYesTextN1a = Colors.white;
                                              _buttonNoColorN1a = Color(0xffe8e8e8);
                                              _buttonNoTextN1a = Colors.black38;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Sim",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: _buttonYesTextN1a,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        width: 144,
                                        height: 35,
                                        decoration: new BoxDecoration(
                                            color: _buttonNoColorN1a,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              _height = finalHeight;
                                              _question3 = 2;
                                              _buttonYesColorN1a = Color(0xffe8e8e8);
                                              _buttonYesTextN1a = Colors.black38;
                                              _buttonNoColorN1a = Color(0xff27b3ff);
                                              _buttonNoTextN1a = Colors.white;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Não",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: _buttonNoTextN1a,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,

                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  _question2 == 2 && _question3 == 2?
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Text("Quando começou a sentir os sintomas?",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context).size.width - 65,
                                              height: 35,
                                              decoration: new BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xffe8e8e8),
                                                      width: 1
                                                  ),
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(left: 15),
                                                    child: Text("14/03/2020",
                                                        style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          color: Colors.black38,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FontStyle.normal,
                                                          letterSpacing: -0.154,

                                                        )
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text("Quais são os seus sintomas?",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Febre",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Tosse",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Escarro",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Congestão Nasal",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Corrimento Nasal",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("",
                                                        style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          color: _buttonNoTextN1a,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FontStyle.normal,
                                                          letterSpacing: -0.154,

                                                        )
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10),
                                            child: Text("Apresenta dificuldade para respirar?",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10),
                                            child: Text("Os olhos estão vermelhos e/ou com secreção?",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10),
                                            child: Text("Tem dificuldade para engolir os alimentos?",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10, left: 20, right: 20),
                                            child: Text("Tem observado se a ponta de seus dedos dos pés ou das mãos estão ficando descorados ou azulados?",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10),
                                            child: Text("Notou ter batimento de asa do nariz?",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10, right: 20, left: 20),
                                            child: Text("Teve contato com pessoa que, nos últimos 14 dias, era caso suspeito ou confirmado para COVID-19?",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top:10, right: 20, left: 20),
                                            child: Text("Como caso suspeito considera-se aquela pessoa que teve febre ou pelo menos um sintoma respiratório ou outros sinais e sintomas inespecíficos como cansaço, dor muscular/articular, dor de cabeça, calafrios, nódulos, diarreia, náusea, vômito e desidratação.",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black38,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,

                                                )
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              AnimatedContainer(
                                                duration: _durationButton,
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonYesColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = 225.00;
                                                      _question3 = 1;
                                                      _buttonYesColorN1a = Color(0xff27b3ff);
                                                      _buttonYesTextN1a = Colors.white;
                                                      _buttonNoColorN1a = Color(0xffe8e8e8);
                                                      _buttonNoTextN1a = Colors.black38;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonYesTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                width: 144,
                                                height: 35,
                                                decoration: new BoxDecoration(
                                                    color: _buttonNoColorN1a,
                                                    borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _height = finalHeight;
                                                      _question3 = 2;
                                                      _buttonYesColorN1a = Color(0xffe8e8e8);
                                                      _buttonYesTextN1a = Colors.black38;
                                                      _buttonNoColorN1a = Color(0xff27b3ff);
                                                      _buttonNoTextN1a = Colors.white;
                                                    });
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            color: _buttonNoTextN1a,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                            fontStyle: FontStyle.normal,
                                                            letterSpacing: -0.154,

                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),


                                        ],
                                      )
                                      :
                                  Container()
                                ],
                              )
                              :
                              Container()
                        ],
                      )
                  ),
                ],
              ),
            ),
    );
  }
}