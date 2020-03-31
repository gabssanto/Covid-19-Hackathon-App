import 'package:covid19/global/generalAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/auto_avaliation/constants.dart';
import 'package:covid19/pages/auto_avaliation/widgets/form.dart';
import 'package:covid19/pages/auto_avaliation/widgets/symptomsQuestion.dart';
import 'package:covid19/pages/auto_avaliation/widgets/textInput.dart';
import 'package:covid19/pages/auto_avaliation/widgets/yesNoLastQuestion.dart';
import 'package:covid19/pages/auto_avaliation/widgets/yesNoQuestion.dart';
import 'package:covid19/pages/auto_avaliation/widgets/yesNoSubtitleQuestion.dart';
import 'package:flutter/material.dart';

class AutoAvaliationPage1 extends StatefulWidget {
  @override
  _AutoAvaliationPage1State createState() => _AutoAvaliationPage1State();
}

class _AutoAvaliationPage1State extends State<AutoAvaliationPage1> {
  final active = Color(0xff27b3ff);

  final inactive = Color(0xffe8e8e8);

  List selected = [0, 0, 0, 0, 0];

  int yesNo = 0;

  @override
  void initState() {
    handleQuestions.clearQuestions();
    handleQuestions.questions.add(0);
    handleQuestions.questions.add(0);
    handleQuestions.questions.add(0);
    print(handleQuestions.questions);
    super.initState();
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
                  padding: EdgeInsets.only(bottom: 80),

                  child: Column(children: <Widget>[
                    Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child:
                                  Text("Você já teve diagnóstico de coronavírus?",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -0.154,
                                      )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: 145,
                                      height: 40,
                                      decoration: new BoxDecoration(
                                          color: handleQuestions.questions[0] == 1
                                              ? active
                                              : inactive,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            yesNo = 1;
                                          });
                                          handleQuestions.setQuestions(0, yesNo);
                                          print('Posicao: 0}');
                                          print(handleQuestions.questions[0]);
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
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      )),
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: 145,
                                      height: 40,
                                      decoration: new BoxDecoration(
                                          color: handleQuestions.questions[0] == 2
                                              ? active
                                              : inactive,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            yesNo = 2;
                                          });
                                          handleQuestions.setQuestions(0, yesNo);
                                          print('Posicao: 0');

                                          print(handleQuestions.questions[0]);
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
                                                  fontSize: 14,
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
                              TextInputQuestion(
                                title: 'Quando começou a sentir os sintomas?',
                                index: 1,
                              ),
                              YesNoLastQuestion(
                                title:
                                    'Está em isolamento residencial ou internamento?',
                                index: 2,
                              )
                            ],
                          )
                        : handleQuestions.questions[0] == 2
                            ? Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text(
                                            "Você já teve diagnóstico de coronavírus?",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black54,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: -0.154,
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                width: 145,
                                                height: 40,
                                                decoration: new BoxDecoration(
                                                    color: handleQuestions
                                                                .questions[1] ==
                                                            1
                                                        ? active
                                                        : inactive,
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      yesNo = 1;
                                                    });
                                                    handleQuestions.setQuestions(
                                                        1, yesNo);
                                                    print('Posicao: 1}');
                                                    print(handleQuestions
                                                        .questions[1]);
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
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
                                                                : Colors.black54,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            letterSpacing: -0.154,
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                            AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 200),
                                                width: 145,
                                                height: 40,
                                                decoration: new BoxDecoration(
                                                    color: handleQuestions
                                                                .questions[1] ==
                                                            2
                                                        ? active
                                                        : inactive,
                                                    borderRadius:
                                                        BorderRadius.circular(6)),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      yesNo = 2;
                                                    });
                                                    handleQuestions.setQuestions(
                                                        1, yesNo);
                                                    print('Posicao: 1');

                                                    print(handleQuestions
                                                        .questions[1]);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
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
                                                                : Colors.black54,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            letterSpacing: -0.154,
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
                                      ? YesNoLastQuestion(
                                          title:
                                              'Está em isolamento residencial ou internamento?',
                                          index: 2,
                                        )
                                      : handleQuestions.questions[1] == 2
                                          ? Column(
                                              children: <Widget>[
                                                YesNoQuestion(
                                                  title:
                                                      'Está em isolamento residencial ou internamento?',
                                                  index: 2,
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
                                                YesNoSubtitleQuestion(
                                                  title:
                                                      'Teve contato com pessoa que, nos últimos 14 dias, era caso suspeito ou confirmado para COVID-19?',
                                                  index: 10,
                                                ),
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
          Positioned(
            bottom: 10,
            left: 15,
            right: 15,
            child: Container(
                height: 45,
                decoration: new BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(6)
                ),
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
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

                        )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
