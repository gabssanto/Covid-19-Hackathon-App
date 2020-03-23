import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './mobx/imports.dart';
import 'signuppage3.dart';
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
                        MaterialPageRoute(builder: (context) => SignupPage3()));
                  },
                ),
              ))
        ],
      ),
    );
  }
}

class SignupPage2 extends StatelessWidget {
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
          key: _formKey,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
                reverse: true,
                child: Container(
                alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 30),
                    child:Column(
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
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0),
                            // add padding to adjust icon
                            child: Icon(Icons.location_city),
                          ),
                        ),
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
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(12)),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                // add padding to adjust icon
                                child: Icon(Icons.location_on),
                              ),
                            ),
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
                            obscureText: true,
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
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 15,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirme a senha',
//                          hintText: 'Confirme a senha',
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
                  Container(child: Btn("Próximo")),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 10),
//                child: Image(
//                  image: AssetImage(ConstantsLoginPage.logoName),
//                ),
                  ),
                ])))));
  }
}
