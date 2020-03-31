import 'package:covid19/main.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SymptomsQuestion extends StatefulWidget {
  final title;
  final index;
  final selected;

  SymptomsQuestion({this.title, this.index, this.selected});

  @override
  _SymptomsQuestion createState() => _SymptomsQuestion();
}

class _SymptomsQuestion extends State<SymptomsQuestion> {
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
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(this.widget.title,
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
                      color: widget.selected[0] == 1 ? active : inactive,
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (widget.selected[0] == 1) {
                          widget.selected[0] = 0;
                        } else
                          widget.selected[0] = 1;
                      });
                      handleQuestions.setQuestions(widget.index, yesNo);
                      print(widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Febre",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[0] == 1
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
                      color: widget.selected[1] == 1 ? active : inactive,
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (widget.selected[1] == 1) {
                          widget.selected[1] = 0;
                        } else
                          widget.selected[1] = 1;
                      });
                      handleQuestions.setQuestions(widget.index, yesNo);
                      print(widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Tosse",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[1] == 1
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
                      color: widget.selected[2] == 1 ? active : inactive,
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (widget.selected[2] == 1) {
                          widget.selected[2] = 0;
                        } else
                          widget.selected[2] = 1;
                      });
                      handleQuestions.setQuestions(widget.index, yesNo);
                      print(widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Escarro",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[2] == 1
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
                      color: widget.selected[3] == 1 ? active : inactive,
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (widget.selected[3] == 1) {
                          widget.selected[3] = 0;
                        } else
                          widget.selected[3] = 1;
                      });
                      handleQuestions.setQuestions(widget.index, yesNo);
                      print(widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Congestão nasal",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[3] == 1
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
                      color: widget.selected[4] == 1 ? active : inactive,
                      borderRadius: BorderRadius.circular(6)),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (widget.selected[4] == 1) {
                          widget.selected[4] = 0;
                        } else
                          widget.selected[4] = 1;
                      });
                      handleQuestions.setQuestions(widget.index, yesNo);
                      print(widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Corrimento Nasal",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[4] == 1
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
              Container(
                width: 145,
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
