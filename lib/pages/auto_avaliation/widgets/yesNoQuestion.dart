import 'package:covid19/main.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class YesNoQuestion extends StatefulWidget {
  final title;
  final index;

  YesNoQuestion({this.title, this.index});

  @override
  _YesNoQuestion createState() => _YesNoQuestion();
}

class _YesNoQuestion extends State<YesNoQuestion> {
  int yesNo = 0;

  final active = Color(0xff27b3ff);

  final inactive = Color(0xffe8e8e8);

  @override
  void initState() {
    handleQuestions.questions.add(0);
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
                          handleQuestions.setQuestions(widget.index, yesNo);
                          print('Posicao: ${this.widget.index}');
                          print(handleQuestions.questions[this.widget.index]);
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
                          handleQuestions.setQuestions(widget.index, yesNo);
                          print('Posicao: ${this.widget.index}');

                          print(handleQuestions.questions[this.widget.index]);
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
