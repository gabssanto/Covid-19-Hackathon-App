import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:intl/intl.dart';
class TextInputQuestion extends StatefulWidget {
  final String title;
  final index;

  TextInputQuestion({this.title, this.index});

  @override
  _TextInputQuestionState createState() => _TextInputQuestionState();
}

class _TextInputQuestionState extends State<TextInputQuestion> {
  final date = new DateFormat('dd/MM/yyyy');
  DateTime selectDate;
  var _dataInfo = ' ';

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
          margin: EdgeInsets.only(top: 15, bottom: 15),
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
          decoration: BoxDecoration(
            color: Color(0xffe8e8e8),
            borderRadius: BorderRadius.circular(8),
          ),
          width: MediaQuery.of(context).size.width / 1.15,
          height: MediaQuery.of(context).size.height / 15,
            child:FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today, color: Colors.black54),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                Text((_dataInfo == ' ' ? 'Selecione uma data' : '${_dataInfo}'),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.154,)
                ),
              ),],
              ),
              onPressed: () async {
                final dtPick = await showDatePicker(context: context, initialDate: _dataInfo == ' ' ? DateTime.now() : selectDate, firstDate: DateTime(2020), lastDate: DateTime.now());

                if (dtPick != null) {
                  setState(() {
                    selectDate = dtPick;
                    _dataInfo = date.format(dtPick);
                    handleQuestions.setQuestions(widget.index, dtPick);
                  });
                }
              },
            ),
        ),
      ],
    );
  }
}
