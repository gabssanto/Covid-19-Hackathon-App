import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './mobx/imports.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return handleLogin.login == null
                  ? Container()
                  : Text(handleLogin.login.name);
            },
          ),
          Container(
            child: TextField(
              controller: _textController,
            ),
          ),
          RaisedButton(
            child: Text('teste'),
            onPressed: () {
              handleLogin.createNewUser(_textController.text, '000', '000');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_right),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
    );
  }
}
