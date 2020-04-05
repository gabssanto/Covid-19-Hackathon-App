import 'package:covid19/main.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class YesNoSubtitleQuestion extends StatefulWidget {
  final title;
  final subtitle;
  final index;

  YesNoSubtitleQuestion({this.title, this.subtitle, this.index});

  @override
  _YesNoSubtitleQuestion createState() => _YesNoSubtitleQuestion();
}

class _YesNoSubtitleQuestion extends State<YesNoSubtitleQuestion> {
  int yesNo = 0;

  final active = Color(0xff27b3ff);

  final inactive = Color(0xffe8e8e8);

  @override
  void initState() {
    //handleQuestions.questions.add(0);
    super.initState();
  }

  @override
  void dispose() {
    handleQuestions.questions.removeLast();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, left: 25, right: 25),
              child: Text(this.widget.title,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.154,

                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Text("Como caso suspeito considera-se aquela pessoa que teve febre ou pelo menos um sintoma respiratório ou outros sinais e sintomas inespecíficos como cansaço, dor muscular/articular, dor de cabeça, calafrios, nódulos, diarreia, náusea, vômito e desidratação.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black38,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: new BoxDecoration(
                          color: handleQuestions.questions[this.widget.index] == 1 ? active : inactive,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            yesNo = 1;

                          });
                          handleQuestions.setLastQuestion(widget.index, yesNo, widget.index);

                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Sim",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: handleQuestions.questions[this.widget.index] == 1 ? Colors.white : Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.154,

                                )
                            ),
                          ],
                        ),
                      )
                  ),
                  AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: new BoxDecoration(
                          color: handleQuestions.questions[this.widget.index] == 2 ? active : inactive,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            yesNo = 2;
                          });
                          handleQuestions.setLastQuestion(widget.index, yesNo, widget.index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Não",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: handleQuestions.questions[this.widget.index] == 2 ? Colors.white : Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.154,

                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
