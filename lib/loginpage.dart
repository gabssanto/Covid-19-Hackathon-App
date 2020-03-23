import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './mobx/imports.dart';
import 'signuppage1.dart';
import 'package:covid19/global/loginAppBar.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
var cpf;
String password;

void _validateInputs() {
  final form = _formKey.currentState;
  if (form.validate()) {
    // Text forms was validated.
    form.save();
  }
}

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
                  onPressed:
//                  _validateInputs
                      () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage1()));
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
        body: Form(
          key: _formKey,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
                reverse: true,
                child: Column(children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 50),
//                    child: CircleAvatar(radius: 100, backgroundColor: Color(0xff27b3ff) ,),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onSaved: (var value) {
                          cpf = value;
                        },
                        validator: (cpf){
                          Pattern pattern =
                              r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regex = new RegExp(pattern);
                          if(cpf.length == 0)
                            return 'Digite o seu CPF';
                          else if ((!regex.hasMatch(cpf)) || cpf.length < 13)
                            return 'Digite um CPF válido';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                          hintText: 'Digite seu CPF',
                          labelText: 'CPF',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff27b3ff), width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0),
                            // add padding to adjust icon
                            child: Icon(Icons.person),
                          ),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        obscureText: true,
                        onSaved: (String value) {
                          password = value;
                        },
                        validator: (password){
                          Pattern pattern =
                              r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(password))
                            return 'A senha deve ter entre 4 e 60 caracteres.';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Senha',
//                          hintText: 'Digite sua senha',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff27b3ff), width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0),
                            // add padding to adjust icon
                            child: Icon(Icons.lock),
                          ),
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
                ]))));
  }
}
