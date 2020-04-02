import 'package:covid19/main.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class YesNoLastQuestion extends StatefulWidget {
  final title;
  final index;

  YesNoLastQuestion({this.title, this.index});

  @override
  _YesNoLastQuestion createState() => _YesNoLastQuestion();
}

class _YesNoLastQuestion extends State<YesNoLastQuestion> {
  int yesNo = 0;

  final active = Color(0xff27b3ff);

  final inactive = Color(0xffe8e8e8);

  @override
  void initState() {
    //handleQuestions.questions.add(0);
    super.initState();
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.154,

                  )
              ),
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
                                  fontSize: 14,
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
                      width: 145,
                      height: 40,
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
                          if(
                          handleQuestions.questions[0] == 1 && handleQuestions.questions[1] != 0 && handleQuestions.questions[2] != 0) {
                            handleQuestions.opacity = 1.0;
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Não",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: handleQuestions.questions[this.widget.index] == 2 ? Colors.white : Colors.black54,
                                  fontSize: 14,
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
