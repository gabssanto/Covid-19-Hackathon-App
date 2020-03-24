// import 'dart:async';
// import 'dart:io';

// import 'package:covid19/global/generalAppBar.dart';
// import 'package:covid19/mobx/imports.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

// double height = 80.00;

// class AutoAvaliationPage extends StatefulWidget {
//   @override
//   _AutoAvaliationPageState createState() => _AutoAvaliationPageState();
// }

// class _AutoAvaliationPageState extends State<AutoAvaliationPage> {
//   var _height = 80.00;
//   static const finalHeight = 1035.00;

//   Duration _duration = new Duration(milliseconds: 500);

//   Duration _durationButton = new Duration(milliseconds: 200);

//   var _buttonYesColor = Color(0xffe8e8e8);

//   var _buttonYesText = Colors.black38;

//   var _buttonNoColor = Color(0xffe8e8e8);

//   var _buttonNoText = Colors.black38;

//   var _buttonYesColorY1 = Color(0xffe8e8e8);

//   var _buttonYesTextY1 = Colors.black38;

//   var _buttonNoColorY1 = Color(0xffe8e8e8);

//   var _buttonNoTextY1 = Colors.black38;

//   var _buttonYesColorN1 = Color(0xffe8e8e8);

//   var _buttonYesTextN1 = Colors.black38;

//   var _buttonNoColorN1 = Color(0xffe8e8e8);

//   var _buttonNoTextN1 = Colors.black38;

//   var _buttonYesColorN1a = Color(0xffe8e8e8);

//   var _buttonYesTextN1a = Colors.black38;

//   var _buttonNoColorN1a = Color(0xffe8e8e8);

//   var _buttonNoTextN1a = Colors.black38;

//   var _button1ColorQ5 = Color(0xffe8e8e8);

//   var _button1TextQ5 = Colors.black38;

//   bool _button1Q5IsSelected = false;

//   var _button2ColorQ5 = Color(0xffe8e8e8);

//   var _button2TextQ5 = Colors.black38;

//   bool _button2Q5IsSelected = false;

//   var _button3ColorQ5 = Color(0xffe8e8e8);

//   var _button3TextQ5 = Colors.black38;

//   bool _button3Q5IsSelected = false;

//   var _button4ColorQ5 = Color(0xffe8e8e8);

//   var _button4TextQ5 = Colors.black38;

//   bool _button4Q5IsSelected = false;

//   var _button5ColorQ5 = Color(0xffe8e8e8);

//   var _button5TextQ5 = Colors.black38;

//   bool _button5Q5IsSelected = false;

//   var _buttonYesColorQ6 = Color(0xffe8e8e8);

//   var _buttonYesTextQ6 = Colors.black38;

//   var _buttonNoColorQ6 = Color(0xffe8e8e8);

//   var _buttonNoTextQ6 = Colors.black38;

//   var _buttonYesColorQ7 = Color(0xffe8e8e8);

//   var _buttonYesTextQ7 = Colors.black38;

//   var _buttonNoColorQ7 = Color(0xffe8e8e8);

//   var _buttonNoTextQ7 = Colors.black38;

//   var _buttonYesColorQ8 = Color(0xffe8e8e8);

//   var _buttonYesTextQ8 = Colors.black38;

//   var _buttonNoColorQ8 = Color(0xffe8e8e8);

//   var _buttonNoTextQ8 = Colors.black38;

//   var _buttonYesColorQ9 = Color(0xffe8e8e8);

//   var _buttonYesTextQ9 = Colors.black38;

//   var _buttonNoColorQ9 = Color(0xffe8e8e8);

//   var _buttonNoTextQ9 = Colors.black38;

//   var _buttonYesColorQ10 = Color(0xffe8e8e8);

//   var _buttonYesTextQ10 = Colors.black38;

//   var _buttonNoColorQ10 = Color(0xffe8e8e8);

//   var _buttonNoTextQ10 = Colors.black38;

//   var _buttonYesColorQ11 = Color(0xffe8e8e8);

//   var _buttonYesTextQ11 = Colors.black38;

//   var _buttonNoColorQ11 = Color(0xffe8e8e8);

//   var _buttonNoTextQ11 = Colors.black38;

//   //SO A PARTIR DESSA MERDA QUE E IMPORATNTE, O RESTO E TUDO A MERDA DA LOGICA DESSA MERDA

//   var _question1 = 0;
//   var _question2 = 0;
//   var _question3 = 0;
//   TextEditingController _question4 = TextEditingController();
//   //Essa merda vai ter que ser uma lista
//   var _question6 = 0;
//   var _question7 = 0;
//   var _question8 = 0;
//   var _question9 = 0;
//   var _question10 = 0;
//   var _question11 = 0;

//   var _question2Y1 = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GeneralAppBar(
//         title: 'Autoavaliação',
//       ),
//       body: Container(
//         color: Color(0xffe8e8e8),
//         child: ListView(
//           children: <Widget>[
//             Container(
//                 margin:
//                     EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
//                 height: _height,
//                 width: MediaQuery.of(context).size.width,
//                 //duration: _duration,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(12))),
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(top: 10),
//                       child: Text("Você já teve diagnóstico de coronavírus?",
//                           style: TextStyle(
//                             fontFamily: 'Montserrat',
//                             color: Colors.black54,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.154,
//                           )),
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         AnimatedContainer(
//                           duration: _durationButton,
//                           margin: EdgeInsets.only(top: 10),
//                           width: 144,
//                           height: 35,
//                           decoration: new BoxDecoration(
//                               color: _buttonYesColor,
//                               borderRadius: BorderRadius.circular(6)),
//                           child: FlatButton(
//                             onPressed: () {
//                               setState(() {
//                                 _height = 225.00;
//                                 _question1 = 1;
//                                 _buttonYesColor = Color(0xff27b3ff);
//                                 _buttonYesText = Colors.white;
//                                 _buttonNoColor = Color(0xffe8e8e8);
//                                 _buttonNoText = Colors.black38;
//                               });
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text("Sim",
//                                     style: TextStyle(
//                                       fontFamily: 'Montserrat',
//                                       color: _buttonYesText,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                       fontStyle: FontStyle.normal,
//                                       letterSpacing: -0.154,
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 10),
//                           width: 144,
//                           height: 35,
//                           decoration: new BoxDecoration(
//                               color: _buttonNoColor,
//                               borderRadius: BorderRadius.circular(6)),
//                           child: FlatButton(
//                             onPressed: () {
//                               setState(() {
//                                 _height = 225.00;
//                                 _question1 = 2;
//                                 _buttonYesColor = Color(0xffe8e8e8);
//                                 _buttonYesText = Colors.black38;
//                                 _buttonNoColor = Color(0xff27b3ff);
//                                 _buttonNoText = Colors.white;
//                               });
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text("Não",
//                                     style: TextStyle(
//                                       fontFamily: 'Montserrat',
//                                       color: _buttonNoText,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                       fontStyle: FontStyle.normal,
//                                       letterSpacing: -0.154,
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     _question1 == 1
//                         ? Column(
//                             children: <Widget>[
//                               Container(
//                                 margin: EdgeInsets.only(top: 10, bottom: 10),
//                                 child: Text("Quando foi diagnosticado?",
//                                     style: TextStyle(
//                                       fontFamily: 'Montserrat',
//                                       color: Colors.black54,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle: FontStyle.normal,
//                                       letterSpacing: -0.154,
//                                     )),
//                               ),
//                               Container(
//                                   width: MediaQuery.of(context).size.width - 65,
//                                   height: 35,
//                                   decoration: new BoxDecoration(
//                                       border: Border.all(
//                                           color: Color(0xffe8e8e8), width: 1),
//                                       borderRadius: BorderRadius.circular(12)),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: <Widget>[
//                                       Container(
//                                         margin: EdgeInsets.only(left: 15),
//                                         child: Text("14/03/2020",
//                                             style: TextStyle(
//                                               fontFamily: 'Montserrat',
//                                               color: Colors.black38,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500,
//                                               fontStyle: FontStyle.normal,
//                                               letterSpacing: -0.154,
//                                             )),
//                                       ),
//                                     ],
//                                   )),
//                               Container(
//                                 margin: EdgeInsets.only(top: 10),
//                                 child: Text(
//                                     "Está em isolamento residencial ou internamento?",
//                                     style: TextStyle(
//                                       fontFamily: 'Montserrat',
//                                       color: Colors.black54,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                       fontStyle: FontStyle.normal,
//                                       letterSpacing: -0.154,
//                                     )),
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: <Widget>[
//                                   AnimatedContainer(
//                                     duration: _durationButton,
//                                     margin: EdgeInsets.only(top: 10),
//                                     width: 144,
//                                     height: 35,
//                                     decoration: new BoxDecoration(
//                                         color: _buttonYesColorY1,
//                                         borderRadius: BorderRadius.circular(6)),
//                                     child: FlatButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _question2Y1 = 1;
//                                           _buttonYesColorY1 = Color(0xff27b3ff);
//                                           _buttonYesTextY1 = Colors.white;
//                                           _buttonNoColorY1 = Color(0xffe8e8e8);
//                                           _buttonNoTextY1 = Colors.black38;
//                                         });
//                                       },
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Text("Sim",
//                                               style: TextStyle(
//                                                 fontFamily: 'Montserrat',
//                                                 color: _buttonYesTextY1,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontStyle: FontStyle.normal,
//                                                 letterSpacing: -0.154,
//                                               )),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(top: 10),
//                                     width: 144,
//                                     height: 35,
//                                     decoration: new BoxDecoration(
//                                         color: _buttonNoColorY1,
//                                         borderRadius: BorderRadius.circular(6)),
//                                     child: FlatButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _question2Y1 = 2;
//                                           _buttonYesColorY1 = Color(0xffe8e8e8);
//                                           _buttonYesTextY1 = Colors.black38;
//                                           _buttonNoColorY1 = Color(0xff27b3ff);
//                                           _buttonNoTextY1 = Colors.white;
//                                         });
//                                       },
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Text("Não",
//                                               style: TextStyle(
//                                                 fontFamily: 'Montserrat',
//                                                 color: _buttonNoTextY1,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w500,
//                                                 fontStyle: FontStyle.normal,
//                                                 letterSpacing: -0.154,
//                                               )),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                         : _question1 == 2
//                             ? Column(
//                                 children: <Widget>[
//                                   Container(
//                                     margin: EdgeInsets.only(top: 10),
//                                     child: Text(
//                                         "Você é um caso suspeito de coronavírus?",
//                                         style: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           color: Colors.black54,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle: FontStyle.normal,
//                                           letterSpacing: -0.154,
//                                         )),
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: <Widget>[
//                                       AnimatedContainer(
//                                         duration: _durationButton,
//                                         margin: EdgeInsets.only(top: 10),
//                                         width: 144,
//                                         height: 35,
//                                         decoration: new BoxDecoration(
//                                             color: _buttonYesColorN1,
//                                             borderRadius:
//                                                 BorderRadius.circular(6)),
//                                         child: FlatButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               _height = 225.00;
//                                               _question2 = 1;
//                                               _buttonYesColorN1 =
//                                                   Color(0xff27b3ff);
//                                               _buttonYesTextN1 = Colors.white;
//                                               _buttonNoColorN1 =
//                                                   Color(0xffe8e8e8);
//                                               _buttonNoTextN1 = Colors.black38;
//                                             });
//                                           },
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text("Sim",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: _buttonYesTextN1,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(top: 10),
//                                         width: 144,
//                                         height: 35,
//                                         decoration: new BoxDecoration(
//                                             color: _buttonNoColorN1,
//                                             borderRadius:
//                                                 BorderRadius.circular(6)),
//                                         child: FlatButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               _height = finalHeight;
//                                               _question2 = 2;
//                                               _buttonYesColorN1 =
//                                                   Color(0xffe8e8e8);
//                                               _buttonYesTextN1 = Colors.black38;
//                                               _buttonNoColorN1 =
//                                                   Color(0xff27b3ff);
//                                               _buttonNoTextN1 = Colors.white;
//                                             });
//                                           },
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text("Não",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: _buttonNoTextN1,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(top: 10),
//                                     child: Text(
//                                         "Está em isolamento residencial ou internamento?",
//                                         style: TextStyle(
//                                           fontFamily: 'Montserrat',
//                                           color: Colors.black54,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                           fontStyle: FontStyle.normal,
//                                           letterSpacing: -0.154,
//                                         )),
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: <Widget>[
//                                       AnimatedContainer(
//                                         duration: _durationButton,
//                                         margin: EdgeInsets.only(top: 10),
//                                         width: 144,
//                                         height: 35,
//                                         decoration: new BoxDecoration(
//                                             color: _buttonYesColorN1a,
//                                             borderRadius:
//                                                 BorderRadius.circular(6)),
//                                         child: FlatButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               _height = 225.00;
//                                               _question3 = 1;
//                                               _buttonYesColorN1a =
//                                                   Color(0xff27b3ff);
//                                               _buttonYesTextN1a = Colors.white;
//                                               _buttonNoColorN1a =
//                                                   Color(0xffe8e8e8);
//                                               _buttonNoTextN1a = Colors.black38;
//                                             });
//                                           },
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text("Sim",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: _buttonYesTextN1a,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(top: 10),
//                                         width: 144,
//                                         height: 35,
//                                         decoration: new BoxDecoration(
//                                             color: _buttonNoColorN1a,
//                                             borderRadius:
//                                                 BorderRadius.circular(6)),
//                                         child: FlatButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               _height = finalHeight;
//                                               _question3 = 2;
//                                               _buttonYesColorN1a =
//                                                   Color(0xffe8e8e8);
//                                               _buttonYesTextN1a =
//                                                   Colors.black38;
//                                               _buttonNoColorN1a =
//                                                   Color(0xff27b3ff);
//                                               _buttonNoTextN1a = Colors.white;
//                                             });
//                                           },
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text("Não",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: _buttonNoTextN1a,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   _question2 == 2 && _question3 == 2
//                                       ? Column(
//                                           children: <Widget>[
//                                             Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 10, bottom: 10),
//                                               child: Text(
//                                                   "Quando começou a sentir os sintomas?",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width -
//                                                     65,
//                                                 height: 35,
//                                                 decoration: new BoxDecoration(
//                                                     border: Border.all(
//                                                         color:
//                                                             Color(0xffe8e8e8),
//                                                         width: 1),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             12)),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: <Widget>[
//                                                     Container(
//                                                       margin: EdgeInsets.only(
//                                                           left: 15),
//                                                       child: Text("14/03/2020",
//                                                           style: TextStyle(
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             color:
//                                                                 Colors.black38,
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontStyle: FontStyle
//                                                                 .normal,
//                                                             letterSpacing:
//                                                                 -0.154,
//                                                           )),
//                                                     ),
//                                                   ],
//                                                 )),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 10),
//                                               child: Text(
//                                                   "Quais são os seus sintomas?",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _button1ColorQ5,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         if (_button1Q5IsSelected ==
//                                                             true) {
//                                                           _button1ColorQ5 =
//                                                               Color(0xffe8e8e8);
//                                                           _button1TextQ5 =
//                                                               Colors.black38;
//                                                           _button1Q5IsSelected =
//                                                               false;
//                                                         } else {
//                                                           _button1ColorQ5 =
//                                                               Color(0xff27b3ff);
//                                                           _button1TextQ5 =
//                                                               Colors.white;
//                                                           _button1Q5IsSelected =
//                                                               true;
//                                                         }
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Febre",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _button1TextQ5,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _button2ColorQ5,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         if (_button2Q5IsSelected ==
//                                                             true) {
//                                                           _button2ColorQ5 =
//                                                               Color(0xffe8e8e8);
//                                                           _button2TextQ5 =
//                                                               Colors.black38;
//                                                           _button2Q5IsSelected =
//                                                               false;
//                                                         } else {
//                                                           _button2ColorQ5 =
//                                                               Color(0xff27b3ff);
//                                                           _button2TextQ5 =
//                                                               Colors.white;
//                                                           _button2Q5IsSelected =
//                                                               true;
//                                                         }
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Tosse",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _button2TextQ5,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _button3ColorQ5,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         if (_button3Q5IsSelected ==
//                                                             true) {
//                                                           _button3ColorQ5 =
//                                                               Color(0xffe8e8e8);
//                                                           _button3TextQ5 =
//                                                               Colors.black38;
//                                                           _button3Q5IsSelected =
//                                                               false;
//                                                         } else {
//                                                           _button3ColorQ5 =
//                                                               Color(0xff27b3ff);
//                                                           _button3TextQ5 =
//                                                               Colors.white;
//                                                           _button3Q5IsSelected =
//                                                               true;
//                                                         }
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Escarro",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _button3TextQ5,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _button4ColorQ5,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         if (_button4Q5IsSelected ==
//                                                             true) {
//                                                           _button4ColorQ5 =
//                                                               Color(0xffe8e8e8);
//                                                           _button4TextQ5 =
//                                                               Colors.black38;
//                                                           _button4Q5IsSelected =
//                                                               false;
//                                                         } else {
//                                                           _button4ColorQ5 =
//                                                               Color(0xff27b3ff);
//                                                           _button4TextQ5 =
//                                                               Colors.white;
//                                                           _button4Q5IsSelected =
//                                                               true;
//                                                         }
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Congestão Nasal",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _button4TextQ5,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _button5ColorQ5,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         if (_button5Q5IsSelected ==
//                                                             true) {
//                                                           _button5ColorQ5 =
//                                                               Color(0xffe8e8e8);
//                                                           _button5TextQ5 =
//                                                               Colors.black38;
//                                                           _button5Q5IsSelected =
//                                                               false;
//                                                         } else {
//                                                           _button5ColorQ5 =
//                                                               Color(0xff27b3ff);
//                                                           _button5TextQ5 =
//                                                               Colors.white;
//                                                           _button5Q5IsSelected =
//                                                               true;
//                                                         }
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Corrimento Nasal",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _button5TextQ5,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Text("",
//                                                           style: TextStyle(
//                                                             fontFamily:
//                                                                 'Montserrat',
//                                                             color:
//                                                                 _buttonNoTextN1a,
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                             fontStyle: FontStyle
//                                                                 .normal,
//                                                             letterSpacing:
//                                                                 -0.154,
//                                                           )),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 10),
//                                               child: Text(
//                                                   "Apresenta dificuldade para respirar?",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonYesColorQ6,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question6 = 1;
//                                                         _buttonYesColorQ6 =
//                                                             Color(0xff27b3ff);
//                                                         _buttonYesTextQ6 =
//                                                             Colors.white;
//                                                         _buttonNoColorQ6 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonNoTextQ6 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Sim",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonYesTextQ6,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonNoColorQ6,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question6 = 2;
//                                                         _buttonNoColorQ6 =
//                                                             Color(0xff27b3ff);
//                                                         _buttonNoTextQ6 =
//                                                             Colors.white;
//                                                         _buttonYesColorQ6 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonYesTextQ6 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Não",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonNoTextQ6,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 10),
//                                               child: Text(
//                                                   "Os olhos estão vermelhos e/ou com secreção?",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonYesColorQ7,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question7 = 1;
//                                                         _buttonYesColorQ7 =
//                                                             Color(0xff27b3ff);
//                                                         _buttonYesTextQ7 =
//                                                             Colors.white;
//                                                         _buttonNoColorQ7 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonNoTextQ7 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Sim",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonYesTextQ7,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonNoColorQ7,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question7 = 2;
//                                                         _buttonNoColorQ7 =
//                                                             Color(0xff27b3ff);
//                                                         _buttonNoTextQ7 =
//                                                             Colors.white;
//                                                         _buttonYesColorQ7 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonYesTextQ7 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Não",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonNoTextQ7,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 10),
//                                               child: Text(
//                                                   "Tem dificuldade para engolir os alimentos?",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonYesColorQ8,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question8 = 1;
//                                                         _buttonYesColorQ8 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonYesTextQ8 =
//                                                             Colors.white;
//                                                         _buttonNoColorQ8 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonNoTextQ8 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Sim",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonYesTextQ8,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonNoColorQ8,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question8 = 2;
//                                                         _buttonNoColorQ8 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonNoTextQ8 =
//                                                             Colors.white;
//                                                         _buttonYesColorQ8 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonYesTextQ8 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Não",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonNoTextQ8,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 10, left: 20, right: 20),
//                                               child: Text(
//                                                   "Tem observado se a ponta de seus dedos dos pés ou das mãos estão ficando descorados ou azulados?",
//                                                   textAlign: TextAlign.start,
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonYesColorQ9,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question9 = 1;
//                                                         _buttonYesColorQ9 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonYesTextQ9 =
//                                                             Colors.white;
//                                                         _buttonNoColorQ9 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonNoTextQ9 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Sim",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonYesTextQ9,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonNoColorQ9,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question9 = 2;
//                                                         _buttonNoColorQ9 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonNoTextQ9 =
//                                                             Colors.white;
//                                                         _buttonYesColorQ9 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonYesTextQ9 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Não",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonNoTextQ9,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 10),
//                                               child: Text(
//                                                   "Notou ter batimento de asa do nariz?",
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonYesColorQ10,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question10 = 1;
//                                                         _buttonYesColorQ10 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonYesTextQ10 =
//                                                             Colors.white;
//                                                         _buttonNoColorQ10 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonNoTextQ10 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Sim",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonYesTextQ10,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonNoColorQ10,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question10 = 2;
//                                                         _buttonNoColorQ10 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonNoTextQ10 =
//                                                             Colors.white;
//                                                         _buttonYesColorQ10 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonYesTextQ10 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Não",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonNoTextQ10,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 10, right: 20, left: 20),
//                                               child: Text(
//                                                   "Teve contato com pessoa que, nos últimos 14 dias, era caso suspeito ou confirmado para COVID-19?",
//                                                   textAlign: TextAlign.start,
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black54,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 10, right: 20, left: 20),
//                                               child: Text(
//                                                   "Como caso suspeito considera-se aquela pessoa que teve febre ou pelo menos um sintoma respiratório ou outros sinais e sintomas inespecíficos como cansaço, dor muscular/articular, dor de cabeça, calafrios, nódulos, diarreia, náusea, vômito e desidratação.",
//                                                   textAlign: TextAlign.start,
//                                                   style: TextStyle(
//                                                     fontFamily: 'Montserrat',
//                                                     color: Colors.black38,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontStyle: FontStyle.normal,
//                                                     letterSpacing: -0.154,
//                                                   )),
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: <Widget>[
//                                                 AnimatedContainer(
//                                                   duration: _durationButton,
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonYesColorQ11,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question11 = 1;
//                                                         _buttonYesColorQ11 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonYesTextQ11 =
//                                                             Colors.white;
//                                                         _buttonNoColorQ11 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonNoTextQ11 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Sim",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonYesTextQ11,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   margin:
//                                                       EdgeInsets.only(top: 10),
//                                                   width: 144,
//                                                   height: 35,
//                                                   decoration: new BoxDecoration(
//                                                       color: _buttonNoColorQ11,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                   child: FlatButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         _question11 = 2;
//                                                         _buttonNoColorQ11 =
//                                                             Color(0xff28b3ff);
//                                                         _buttonNoTextQ11 =
//                                                             Colors.white;
//                                                         _buttonYesColorQ11 =
//                                                             Color(0xffe8e8e8);
//                                                         _buttonYesTextQ11 =
//                                                             Colors.black38;
//                                                       });
//                                                     },
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                         Text("Não",
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'Montserrat',
//                                                               color:
//                                                                   _buttonNoTextQ11,
//                                                               fontSize: 14,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500,
//                                                               fontStyle:
//                                                                   FontStyle
//                                                                       .normal,
//                                                               letterSpacing:
//                                                                   -0.154,
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         )
//                                       : Container()
//                                 ],
//                               )
//                             : Container()
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
