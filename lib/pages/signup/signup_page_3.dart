import 'package:covid19/pages/home/home_page.dart';
import 'package:covid19/pages/signup/widgets/BtnSignup.dart';
import 'package:flutter/material.dart';
import 'package:covid19/global/loginAppBar.dart';

class SignUpPage3 extends StatefulWidget {
  SignUpPage3({Key key}) : super(key: key);

  @override
  _SignupPage3 createState() => _SignupPage3();
}

class _SignupPage3 extends State<SignUpPage3> {
  final GlobalKey<FormState> _signupForm3 = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: LoginAppBar(
          title: 'Cadastre-se',
          canGoBack: true,
        ),
        body: Form(
            key: _signupForm3,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
                reverse: true,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Quantas pessoas residem com você na sua casa?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6f6f6f))),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  labelText: 'Número de Pessoas',
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
                                    child: Icon(Icons.people),
                                  ),
                                ),
                                validator: (String qtdPessoas) {
                                  RegExp pattern = new RegExp(r'\d{1,2}');
                                  return pattern.hasMatch(qtdPessoas.trim())
                                      ? (() => int.parse(qtdPessoas.trim()) > 50
                                          ? 'Entre com uma quantidade válida'
                                          : null)()
                                      : 'Entre com uma quantidade válida';
                                },
                              )),
                          Container(margin: EdgeInsets.only(top: 40)),
                          Container(
                              child: BtnSignup(
                            text: "Finalizar Cadastro",
                            onPressed: this._validateInputs,
                          )),
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 10),
                          ),
                        ])))));
  }

  void _validateInputs() {
    if (_signupForm3.currentState.validate()) {
      _signupForm3.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
