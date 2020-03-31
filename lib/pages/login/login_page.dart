import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/home/home_page.dart';
import 'package:covid19/pages/signup/signup_page_1.dart';
import 'package:flutter/material.dart';
import 'package:covid19/global/loginAppBar.dart';
import 'package:covid19/pages/login/widgets/button.dart';

class ConstantsLoginPage {
  static final logo = 'assets/app_logo.png';
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _cpf;
  String _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: LoginAppBar(
          title: 'Login',
          canGoBack: false,
        ),
        body: Form(
            key: _loginForm,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
                reverse: true,
                child: Column(children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ConstantsLoginPage.logo),
                        ),
                      ),
                    ),
                  ),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 15,
                    child: TextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        hintText: "Digite seu e-mail",
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff27b3ff), width: 1.0),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          // add padding to adjust icon
                          child: Icon(Icons.email),
                        ),
                      ),
                      validator: (String email) {
                        RegExp pattern = new RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
                        return pattern.hasMatch(email.trim())
                            ? null
                            : 'Email inválido';
                      },
                      onSaved: (String val) {
                        _cpf = val;
                      },
                    )),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        obscureText: true,
                        validator: (String string) {
                          return string.length > 6 ? null : 'Senha inválida';
                        },
                        onSaved: (String string) {
                          _senha = string;
                        },
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',
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
                  Container(
                      child: Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                    borderRadius:
                                        new BorderRadius.circular(12.0),
                                  ),
                                  color: Color(0xff27b3ff),
                                  child: Text('Entrar',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  onPressed: () {
                                    if (_loginForm.currentState.validate()) {
                                      _loginForm.currentState.save();
                                      var a = handleUser.login(_cpf, _senha);
                                      if(a != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      }
                                    } else {
                                      setState(() {
                                        _autoValidate = true;
                                      });
                                    }
                                  }),
                            ))
                      ],
                    ),
                  )),
//                  Container(child: BtnItem("Cadastrar-se", SignUpPage1())),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 10),
                  ),
                ]))));
  }
}
