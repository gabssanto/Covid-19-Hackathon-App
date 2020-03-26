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
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (String cpf) {
                          RegExp pattern =
                              new RegExp(r'^\d{3}\.?\d{3}\.?\d{3}\-?\d{2}$');
                          return pattern.hasMatch(cpf)
                              ? (() {
                                  cpf =
                                      cpf.replaceAll(new RegExp(r'[\.-]'), '');
                                  int soma = 0;
                                  var digito1;
                                  var digito2;
                                  var j = 10;
                                  for (int i = 0; i < 9; i++) {
                                    soma += int.parse(cpf[i]) * j;
                                    j--;
                                  }
                                  soma %= 11;
                                  soma < 2 ? digito1 = 0 : digito1 = 11 - soma;
                                  if (digito1 == int.parse(cpf[9])) {
                                    soma = 0;
                                    j = 11;
                                    for (int i = 0; i < 10; i++) {
                                      soma += int.parse(cpf[i]) * j;
                                      j--;
                                    }
                                    soma %= 11;
                                    soma < 2
                                        ? digito2 = 0
                                        : digito2 = 11 - soma;
                                  }
                                  return digito1 == int.parse(cpf[9]) &&
                                          digito2 == int.parse(cpf[10])
                                      ? null
                                      : 'CPF inválido';
                                })()
                              : 'CPF inválido';
                        },
                        onSaved: (String string) {
                          _cpf = string;
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
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
                  Container(child: BtnItem("Cadastrar-se", SignUpPage1())),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 10),
                  ),
                ]))));
  }
}
