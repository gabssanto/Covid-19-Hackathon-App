import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/signup/constants.dart';
import 'package:flutter/material.dart';

class ChronicDiseasesQuestion extends StatefulWidget {
  final title;
  final index;
  final selected;

  ChronicDiseasesQuestion({this.title, this.index, this.selected});

  @override
  _ChronicDiseasesQuestion createState() => _ChronicDiseasesQuestion();
}

class _ChronicDiseasesQuestion extends State<ChronicDiseasesQuestion> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildOption(context: context, text: 'Diabetes', index: 0),
              _buildOption(context: context, text: 'Hipertensão', index: 1),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.18,
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildOption(
                  context: context, text: 'Insuficiência\nCardíaca', index: 2),
              _buildOption(
                  context: context, text: 'Insuficiência\nRenal', index: 3),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width / 1.18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildOption(
                context: context,
                text: 'Doença respiratória crônica',
                index: 4,
                expanded: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildOption({context, String text, int index, bool expanded = false}) {
    final w = MediaQuery.of(context).size.width;
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: expanded ? w / 1.5 : w / 2.5,
        height: MediaQuery.of(context).size.height / 17,
        decoration: new BoxDecoration(
            color: widget.selected[index] == 1
                ? ConstantsSignupPage.activeButtonColor
                : ConstantsSignupPage.inactiveButtonColor,
            borderRadius: BorderRadius.circular(6)),
        child: FlatButton(
          onPressed: () {
            setState(() {
              widget.selected[index] = widget.selected[index] == 1 ? 0 : 1;
            });
            handleQuestions.setQuestions(widget.index, widget.selected);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: widget.selected[index] == 1
                      ? Colors.white
                      : Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.154,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
