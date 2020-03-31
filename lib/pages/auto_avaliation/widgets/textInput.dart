import 'package:flutter/material.dart';

class TextInputQuestion extends StatefulWidget {
  final title;
  final index;

  TextInputQuestion({this.title, this.index});

  @override
  _TextInputQuestionState createState() => _TextInputQuestionState();
}

class _TextInputQuestionState extends State<TextInputQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
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
            width: 304,
            height: 35,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xffe8e8e8), width: 2),
            )
        ),
      ],
    );
  }
}
