import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './mobx/imports.dart';
import 'homepage.dart';
import 'package:covid19/global/loginAppBar.dart';

class Btn extends StatelessWidget {
  final String text;

  Btn(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 15,
              child: Container(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                  color: Color(0xff27b3ff),
                  child: Text(text,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                ),
              ))
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: LoginAppBar(
          title: 'Login',
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Column(children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: 100
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff27b3ff), width: 1.0),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 0),
                        // add padding to adjust icon
                        child: Icon(Icons.person),
                      ),
                      hintText: 'CPF',
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff27b3ff), width: 1.0),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 0),
                        // add padding to adjust icon
                        child: Icon(Icons.lock),
                      ),
                      hintText: 'Senha',
                    ),
                  )),
              Container(margin: EdgeInsets.only(top: 40)),
              Container(child: Btn("Entrar")),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10),
//                child: Image(
//                  image: AssetImage(ConstantsLoginPage.logoName),
//                ),
              ),
            ])));
  }
}
