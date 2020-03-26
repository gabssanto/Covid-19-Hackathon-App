import 'package:covid19/pages/signup/signup_page_3.dart';
import 'package:covid19/pages/signup/widgets/BtnSignup.dart';
import 'package:flutter/material.dart';
import 'package:covid19/global/loginAppBar.dart';

class SignUpPage2 extends StatefulWidget {
  SignUpPage2({Key key}) : super(key: key);

  @override
  _SignupPage2 createState() => _SignupPage2();
}

class _SignupPage2 extends State<SignUpPage2> {
  final GlobalKey<FormState> _signupForm2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  final passKey = GlobalKey<FormFieldState>();
  String _senha1;

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
            key: _signupForm2,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
                reverse: true,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Localização',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff27b3ff))),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  hintText: 'Digite seu cidade/municipio',
                                  labelText: 'Cidade/Municipio',
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
                                    child: Icon(Icons.location_city),
                                  ),
                                ),
                                validator: (String cidade) {
                                  return cidade.length > 0
                                      ? null
                                      : 'Digite o nome de sua Cidade';
                                },
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  hintText: 'Digite seu bairro',
                                  labelText: 'Bairro',
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
                                    child: Icon(Icons.location_on),
                                  ),
                                ),
                                validator: (String bairro) {
                                  return bairro.length > 0
                                      ? null
                                      : 'Digite o nome de seu bairro';
                                },
                              )),
                          Text('Segurança',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff27b3ff))),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                key: passKey,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  hintText: 'Digite sua senha',
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
                                    child: Icon(Icons.lock),
                                  ),
                                ),
                                validator: (String password) {
                                  return password.length > 6
                                      ? null
                                      : 'senha deve ter mais de 6 digítos';
                                },
                                onSaved: (String val) {
                                  _senha1 = val;
                                },
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirme a senha',
                                  hintText: 'Confirme a senha',
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
                                    child: Icon(Icons.lock),
                                  ),
                                ),
                                validator: (String password) {
                                  return passKey.currentState.value == password
                                      ? null
                                      : 'As senhas devem ser iguais';
                                },
                              )),
                          Container(margin: EdgeInsets.only(top: 40)),
                          BtnSignup(
                            text: "Próximo",
                            onPressed: this._validateInputs,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 10),
                          ),
                        ])))));
  }

  void _validateInputs() {
    if (_signupForm2.currentState.validate()) {
      _signupForm2.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUpPage3()));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
