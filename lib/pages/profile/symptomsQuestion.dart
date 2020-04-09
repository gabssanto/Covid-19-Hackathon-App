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
          width: MediaQuery.of(context).size.width / 1.15,
          margin: EdgeInsets.only(top: 15),
          child: Text(this.widget.title,
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
          width: MediaQuery.of(context).size.width / 1.18,
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 17,
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
                      handleQuestions.setQuestions(widget.index, widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Diabetes",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[0] == 1
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
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 17,
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
                      handleQuestions.setQuestions(widget.index, widget.selected);
                      print('DENTRO: ${handleQuestions.questions}');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Hipertensão",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[1] == 1
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
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width / 1.18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 12,
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
                      handleQuestions.setQuestions(widget.index, widget.selected);
                      print('DENTRO: ${handleQuestions.questions}');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Insuficiência\nCardíaca",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[2] == 1
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
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 12,
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
                      handleQuestions.setQuestions(widget.index, widget.selected);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Insuficiência\nRenal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[3] == 1
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
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width / 1.18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width / 1.18,
                  height: MediaQuery.of(context).size.height / 17,
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
                      handleQuestions.setQuestions(widget.index, widget.selected);
                      print('DENTRO: ${handleQuestions.questions}');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Doença respiratória crônica",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.selected[4] == 1
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
        ),
      ],
    );
  }
}
