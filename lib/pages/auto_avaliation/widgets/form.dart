import 'package:covid19/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:json_to_form/json_schema.dart';

class AutoAvaliationForm extends StatefulWidget {
  final String formPath;

  AutoAvaliationForm({this.formPath});

  @override
  _AutoAvaliationFormState createState() => _AutoAvaliationFormState();
}

class _AutoAvaliationFormState extends State<AutoAvaliationForm> {
  dynamic response;

  Map decorations = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(widget.formPath),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? new JsonSchema(
                form: snapshot.data,
                onChanged: (dynamic response) {
                  this.response = response;
                },
                actionSave: (data) {
                  print(data);
                },
                buttonSave: new Container(
                  height: 40.0,
                  color: Color(0xff27b3ff),
                  child: Center(
                      child: FlatButton(
                    onPressed: () {
                      print(response);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Confirmar",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )),
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
