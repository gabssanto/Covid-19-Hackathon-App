import 'package:covid19/global/generalAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/auto_avaliation/widgets/symptomsQuestion.dart';
import 'package:covid19/pages/auto_avaliation/widgets/textInput.dart';
import 'package:covid19/pages/auto_avaliation/widgets/yesNoQuestion.dart';
import 'package:flutter/material.dart';
import 'package:covid19/global/RedDialog.dart';
import 'package:covid19/global/YellowDialog.dart';

class AutoAvaliationPage1 extends StatefulWidget {
  @override
  _AutoAvaliationPage1State createState() => _AutoAvaliationPage1State();
}

class _AutoAvaliationPage1State extends State<AutoAvaliationPage1> {
  final active = Color(0xff27b3ff);

  final inactive = Color(0xffe8e8e8);

  bool submit = false;

  List selected = [0, 0, 0, 0, 0];

  int yesNo = 0;

  int countSymtoms = 0;

  var _opacity = 1.0;


  @override
  void initState() {
    handleQuestions.opacity = false;
    handleQuestions.clearQuestions();
    handleQuestions.questions.add(0);
    handleQuestions.questions.add(0);
    handleQuestions.questions.add(0);
    for (int i = 0; i <= 7; i++) {
      handleQuestions.questions.add(0);
    }
    print(handleQuestions.questions);
    super.initState();
  }

  void countSymtomsFunction() {

    for(int i = 0; i < selected.length; i++){
      if(selected[i] == 1)
        countSymtoms++;
    }
    for(int i = 5; i < handleQuestions.questions.length; i++){
      if(handleQuestions.questions[i] == 1)
        countSymtoms++;
    }
    print("TOTAL DE SINTOMAS: ${countSymtoms}");
  }


  @override
  void dispose() {
    if (handleQuestions.questions.length != 0) {
      for (int i = 0; i < handleQuestions.questions.length; i++) {
        handleQuestions.questions.removeAt(i);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: GeneralAppBar(
        title: 'Autoavaliação',
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  padding: EdgeInsets.only(bottom: 80),
                  child: Column(children: <Widget>[
                    Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              // Questao 01
                              width: MediaQuery.of(context).size.width / 1.15,
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                  "Você já teve diagnóstico de coronavírus?",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.154,
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.15,
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              17,
                                      decoration: new BoxDecoration(
                                          color:
                                              handleQuestions.questions[0] == 1
                                                  ? active
                                                  : inactive,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            handleQuestions.questions[0] == 1
                                                ? yesNo = 0
                                                : yesNo = 1;
                                            handleQuestions.typeForm == 1;
                                          });
                                          handleQuestions.setQuestions(
                                              0, yesNo);
                                          for (int i = 1;
                                              i <
                                                  handleQuestions
                                                      .questions.length;
                                              i++) {
                                            handleQuestions.setQuestions(i, 0);
                                          }
                                          print(handleQuestions.questions);
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Sim",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: handleQuestions
                                                              .questions[0] ==
                                                          1
                                                      ? Colors.white
                                                      : Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      )),
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              17,
                                      decoration: new BoxDecoration(
                                          color:
                                              handleQuestions.questions[0] == 2
                                                  ? active
                                                  : inactive,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            handleQuestions.questions[0] == 2
                                                ? yesNo = 0
                                                : yesNo = 2;
                                            handleQuestions.typeForm == 2;
                                          });
                                          handleQuestions.setQuestions(
                                              0, yesNo);
                                          for (int i = 1;
                                              i <
                                                  handleQuestions
                                                      .questions.length;
                                              i++) {
                                            handleQuestions.setQuestions(i, 0);
                                          }
                                          print(handleQuestions.questions);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Não",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: handleQuestions
                                                              .questions[0] ==
                                                          2
                                                      ? Colors.white
                                                      : Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    handleQuestions.questions[0] == 1
                        ? Column(
                            children: <Widget>[
                              // Questao 02.1
                              TextInputQuestion(
                                title: 'Quando foi diagnosticado?',
                                index: 1,
                              ),
                              // Questao 03.1
                              Container(
                                width: MediaQuery.of(context).size.width / 1.15,
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                    'Está em isolamento residencial ou internamento?',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.154,
                                    )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.15,
                                margin: EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                17,
                                        decoration: new BoxDecoration(
                                            color:
                                                handleQuestions.questions[2] ==
                                                        1
                                                    ? active
                                                    : inactive,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              handleQuestions.questions[2] == 1
                                                  ? yesNo = 0
                                                  : yesNo = 1;
                                            });
                                            handleQuestions.setLastQuestion(
                                                2, yesNo, 2);
                                            print(handleQuestions.questions);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Sim",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: handleQuestions
                                                                .questions[2] ==
                                                            1
                                                        ? Colors.white
                                                        : Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,
                                                  )),
                                            ],
                                          ),
                                        )),
                                    AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                17,
                                        decoration: new BoxDecoration(
                                            color:
                                                handleQuestions.questions[2] ==
                                                        2
                                                    ? active
                                                    : inactive,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              handleQuestions.questions[2] == 2
                                                  ? yesNo = 0
                                                  : yesNo = 2;
                                            });
                                            handleQuestions.setLastQuestion(
                                                2, yesNo, 2);
                                            print(handleQuestions.questions);
                                            if (handleQuestions
                                                        .questions[0] ==
                                                    1 &&
                                                handleQuestions.questions[1] !=
                                                    0 &&
                                                handleQuestions.questions[2] !=
                                                    0) {
                                              handleQuestions.opacity = 1.0;
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Não",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: handleQuestions
                                                                .questions[2] ==
                                                            2
                                                        ? Colors.white
                                                        : Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,
                                                  )),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          )
                        : handleQuestions.questions[0] == 2
                            ? Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        // Questao 02.2
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text(
                                            "Você é um caso suspeito de coronavírus?",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black54,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: -0.154,
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    17,
                                                decoration: new BoxDecoration(
                                                    color: handleQuestions
                                                                .questions[1] ==
                                                            1
                                                        ? active
                                                        : inactive,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      handleQuestions.questions[
                                                                  1] ==
                                                              1
                                                          ? yesNo = 0
                                                          : yesNo = 1;
                                                      handleQuestions.typeForm == 2;
                                                    });
                                                    handleQuestions
                                                        .setQuestions(1, yesNo);
                                                    for (int i = 2;
                                                        i <
                                                            handleQuestions
                                                                .questions
                                                                .length;
                                                        i++) {
                                                      handleQuestions
                                                          .setQuestions(i, 0);
                                                    }
                                                    print(handleQuestions
                                                        .questions);
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text("Sim",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: handleQuestions
                                                                            .questions[
                                                                        1] ==
                                                                    1
                                                                ? Colors.white
                                                                : Colors
                                                                    .black54,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing:
                                                                -0.154,
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                            AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    17,
                                                decoration: new BoxDecoration(
                                                    color: handleQuestions
                                                                .questions[1] ==
                                                            2
                                                        ? active
                                                        : inactive,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      handleQuestions.questions[
                                                                  1] ==
                                                              2
                                                          ? yesNo = 0
                                                          : yesNo = 2;
                                                      handleQuestions.typeForm == 3;
                                                    });
                                                    for (int i = 2;
                                                        i <
                                                            handleQuestions
                                                                .questions
                                                                .length;
                                                        i++) {
                                                      handleQuestions
                                                          .setQuestions(i, 0);
                                                    }
                                                    handleQuestions
                                                        .setQuestions(1, yesNo);
                                                    print(handleQuestions
                                                        .questions);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text("Não",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: handleQuestions
                                                                            .questions[
                                                                        1] ==
                                                                    2
                                                                ? Colors.white
                                                                : Colors
                                                                    .black54,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing:
                                                                -0.154,
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  handleQuestions.questions[1] == 1
                                      ? Column(
                                          children: <Widget>[
                                            Container(
                                              // Questao 03.2
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.15,
                                              margin: EdgeInsets.only(
                                                  top: 15, left: 25, right: 25),
                                              child: Text(
                                                  'Está em isolamento residencial ou internamento?',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: -0.154,
                                                  )),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.15,
                                              margin: EdgeInsets.only(top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      decoration: new BoxDecoration(
                                                          color: handleQuestions
                                                                          .questions[
                                                                      2] ==
                                                                  1
                                                              ? active
                                                              : inactive,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: FlatButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            handleQuestions.questions[
                                                                        2] ==
                                                                    1
                                                                ? yesNo = 0
                                                                : yesNo = 1;
                                                          });
                                                          handleQuestions
                                                              .setLastQuestion(
                                                                  2, yesNo, 2);
                                                          print(handleQuestions
                                                              .questions);
                                                        },
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Text("Sim",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: handleQuestions.questions[
                                                                              2] ==
                                                                          1
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black54,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  letterSpacing:
                                                                      -0.154,
                                                                )),
                                                          ],
                                                        ),
                                                      )),
                                                  AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                      decoration: new BoxDecoration(
                                                          color: handleQuestions
                                                                          .questions[
                                                                      2] ==
                                                                  2
                                                              ? active
                                                              : inactive,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: FlatButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            handleQuestions.questions[
                                                                        2] ==
                                                                    2
                                                                ? yesNo = 0
                                                                : yesNo = 2;
                                                          });
                                                          handleQuestions
                                                              .setLastQuestion(
                                                                  2, yesNo, 2);
                                                          if (handleQuestions.questions[0] == 1 &&
                                                              handleQuestions
                                                                          .questions[
                                                                      1] !=
                                                                  0 &&
                                                              handleQuestions
                                                                          .questions[
                                                                      2] !=
                                                                  0) {
                                                            handleQuestions
                                                                .opacity = 1.0;
                                                          }
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Text("Não",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: handleQuestions.questions[
                                                                              2] ==
                                                                          2
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black54,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  letterSpacing:
                                                                      -0.154,
                                                                )),
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      : handleQuestions.questions[1] == 2
                                          ? Column(
                                              children: <Widget>[
                                                Container(
                                                  // Questao 03.2
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.15,
                                                  margin: EdgeInsets.only(
                                                      top: 15,
                                                      left: 25,
                                                      right: 25),
                                                  child: Text(
                                                      'Está em isolamento residencial ou internamento?',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black54,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        letterSpacing: -0.154,
                                                      )),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.15,
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                          height: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                          decoration: new BoxDecoration(
                                                              color: handleQuestions
                                                                              .questions[
                                                                          2] ==
                                                                      1
                                                                  ? active
                                                                  : inactive,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: FlatButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                handleQuestions.questions[
                                                                            2] ==
                                                                        1
                                                                    ? yesNo = 0
                                                                    : yesNo = 1;
                                                              });
                                                              handleQuestions
                                                                  .setLastQuestion(
                                                                      2,
                                                                      yesNo,
                                                                      2);
                                                              print(handleQuestions
                                                                  .questions);
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Text("Sim",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: handleQuestions.questions[2] == 1
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black54,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      letterSpacing:
                                                                          -0.154,
                                                                    )),
                                                              ],
                                                            ),
                                                          )),
                                                      AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                          height: MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .height /
                                                              17,
                                                          decoration: new BoxDecoration(
                                                              color: handleQuestions
                                                                              .questions[
                                                                          2] ==
                                                                      2
                                                                  ? active
                                                                  : inactive,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: FlatButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                handleQuestions.questions[
                                                                            2] ==
                                                                        2
                                                                    ? yesNo = 0
                                                                    : yesNo = 2;
                                                              });
                                                              handleQuestions
                                                                  .setLastQuestion(
                                                                      2,
                                                                      yesNo,
                                                                      2);
                                                              if (handleQuestions.questions[0] == 1 &&
                                                                  handleQuestions
                                                                              .questions[
                                                                          1] !=
                                                                      0 &&
                                                                  handleQuestions
                                                                              .questions[
                                                                          2] !=
                                                                      0) {
                                                                handleQuestions
                                                                        .opacity =
                                                                    1.0;
                                                              }
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Text("Não",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: handleQuestions.questions[2] == 2
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .black54,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      letterSpacing:
                                                                          -0.154,
                                                                    )),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                TextInputQuestion(
                                                  title:
                                                      'Quando começou a sentir os sintomas?',
                                                  index: 3,
                                                ),
                                                SymptomsQuestion(
                                                  title:
                                                      'Quais são os seus sintomas?',
                                                  index: 4,
                                                  selected: selected,
                                                ),
                                                YesNoQuestion(
                                                  title:
                                                      'Apresenta dificuldade para respirar?',
                                                  index: 5,
//                                                    answer: (int value){
//                                                    }
                                                ),
                                                YesNoQuestion(
                                                  title:
                                                      'Os olhos estão vermelhos e/ou com secreção?',
                                                  index: 6,
                                                ),
                                                YesNoQuestion(
                                                  title:
                                                      'Tem dificuldade para engolir os alimentos?',
                                                  index: 7,
                                                ),
                                                YesNoQuestion(
                                                  title:
                                                      'Tem observado se a ponta de seus dedos dos pés ou das mãos estão ficando descorados ou azulados?',
                                                  index: 8,
                                                ),
                                                YesNoQuestion(
                                                  title:
                                                      'Notou ter batimento de asa do nariz?',
                                                  index: 9,
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15,
                                                          left: 25,
                                                          right: 25),
                                                      child: Text(
                                                          'Teve contato com pessoa que, nos últimos 14 dias, era caso suspeito ou confirmado para COVID-19?',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing:
                                                                -0.154,
                                                          )),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10,
                                                          left: 25,
                                                          right: 25),
                                                      child: Text(
                                                          "Como caso suspeito considera-se aquela pessoa que teve febre ou pelo menos um sintoma respiratório ou outros sinais e sintomas inespecíficos como cansaço, dor muscular/articular, dor de cabeça, calafrios, nódulos, diarreia, náusea, vômito e desidratação.",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color:
                                                                Colors.black38,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          )),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.15,
                                                      margin: EdgeInsets.only(
                                                          top: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      200),
                                                              width: MediaQuery
                                                                          .of(
                                                                              context)
                                                                      .size
                                                                      .width /
                                                                  2.5,
                                                              height:
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      17,
                                                              decoration: new BoxDecoration(
                                                                  color: handleQuestions.questions[
                                                                              10] ==
                                                                          1
                                                                      ? active
                                                                      : inactive,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: FlatButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    handleQuestions.questions[10] ==
                                                                            1
                                                                        ? yesNo =
                                                                            0
                                                                        : yesNo =
                                                                            1;
                                                                  });
                                                                  handleQuestions
                                                                      .setLastQuestion(
                                                                          10,
                                                                          yesNo,
                                                                          10);
                                                                  print(handleQuestions
                                                                      .questions);
                                                                },
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text("Sim",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color: handleQuestions.questions[10] == 1
                                                                              ? Colors.white
                                                                              : Colors.black54,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle:
                                                                              FontStyle.normal,
                                                                          letterSpacing:
                                                                              -0.154,
                                                                        )),
                                                                  ],
                                                                ),
                                                              )),
                                                          AnimatedContainer(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      200),
                                                              width: MediaQuery
                                                                          .of(
                                                                              context)
                                                                      .size
                                                                      .width /
                                                                  2.5,
                                                              height:
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      17,
                                                              decoration: new BoxDecoration(
                                                                  color: handleQuestions.questions[
                                                                              10] ==
                                                                          2
                                                                      ? active
                                                                      : inactive,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child: FlatButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    handleQuestions.questions[10] ==
                                                                            2
                                                                        ? yesNo =
                                                                            0
                                                                        : yesNo =
                                                                            2;
                                                                  });
                                                                  handleQuestions
                                                                      .setLastQuestion(
                                                                          10,
                                                                          yesNo,
                                                                          10);
                                                                  print(handleQuestions
                                                                      .questions);
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text("Não",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color: handleQuestions.questions[10] == 2
                                                                              ? Colors.white
                                                                              : Colors.black54,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle:
                                                                              FontStyle.normal,
                                                                          letterSpacing:
                                                                              -0.154,
                                                                        )),
                                                                  ],
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          : Container()
                                ],
                              )
                            : Container()
                  ]),
                ),
              ],
            ),
          ),
          handleQuestions.questions[0] == 1 && handleQuestions.questions[1] != 0 && handleQuestions.questions[2] != 0 ||
              handleQuestions.questions[0] == 2 && handleQuestions.questions[1] == 1 && handleQuestions.questions[2] != 0 ||
                  handleQuestions.questions[0] == 2 &&
                      handleQuestions.questions[1] == 2 &&
                      handleQuestions.questions[2] != 0 &&
                      handleQuestions.questions[3] != 0 &&
                      handleQuestions.questions[5] != 0 &&
                      handleQuestions.questions[6] != 0 &&
                      handleQuestions.questions[7] != 0 &&
                      handleQuestions.questions[8] != 0 &&
                      handleQuestions.questions[9] != 0 &&
                      handleQuestions.questions[10] != 0
              ? Positioned(
                  bottom: 10,
                  left: 15,
                  right: 15,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: 1,
                    child: Container(
                      height: 45,
                      decoration: new BoxDecoration(
                          color: active,
                          borderRadius: BorderRadius.circular(6)),
                      child: FlatButton(
                        onPressed: () {
                          countSymtomsFunction();
                          showDialog(
                              context: context,
                              // ignore: missing_return
                              builder: (BuildContext context) {
                                if (handleQuestions.questions[0] == 1 &&
                                    handleQuestions.questions[1] != 0 &&
                                    handleQuestions.questions[2] != 0 || (handleQuestions.questions[0] == 2 &&
                                    handleQuestions.questions[1] == 2 &&
                                    handleQuestions.questions[2] != 0 &&
                                    handleQuestions.questions[3] != 0 &&
                                    handleQuestions.questions[5] != 0 &&
                                    handleQuestions.questions[6] != 0 &&
                                    handleQuestions.questions[7] != 0 &&
                                    handleQuestions.questions[8] != 0 &&
                                    handleQuestions.questions[9] != 0 &&
                                    handleQuestions.questions[10] != 0 && countSymtoms>=3)) {
                                  return RedDialog();
                                } else if (handleQuestions.questions[0] == 2 &&
                                    handleQuestions.questions[1] == 1 &&
                                    handleQuestions.questions[2] != 0 ||(
                                    handleQuestions.questions[1] == 2 &&
                                    handleQuestions.questions[2] != 0 &&
                                    handleQuestions.questions[3] != 0 &&
                                    handleQuestions.questions[5] != 0 &&
                                    handleQuestions.questions[6] != 0 &&
                                    handleQuestions.questions[7] != 0 &&
                                    handleQuestions.questions[8] != 0 &&
                                    handleQuestions.questions[9] != 0 &&
                                    handleQuestions.questions[10] != 0 && countSymtoms<3)) {
                                  return YellowDialog();
                                }
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Confirmar",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.154,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  bottom: 10,
                  left: 15,
                  right: 15,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: 0.5,
                    child: Container(
                      height: 45,
                      decoration: new BoxDecoration(
                          color: active,
                          borderRadius: BorderRadius.circular(6)),
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Confirmar",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.154,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
