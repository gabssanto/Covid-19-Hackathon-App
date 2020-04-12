import 'package:covid19/global/appSnackBar.dart';
import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/handleHttpConnections.dart';
import 'package:covid19/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: 'Login',
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Builder(builder: (BuildContext context) {
          return Form(
            key: _loginForm,
            autovalidate: _autoValidate,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildLogoImage(context),
                _buildTextFields(context),
                _buildLoginButton(context),
              ],
            ),
          );
        }),
      ),
    );
  }

  Container _buildLogoImage(context) {
    return Container(
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
    );
  }

  _buildTextFields(context) {
    return Container(
        child: Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 15,
              child: TextFormField(
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: new InputDecoration(
                  hintText: "Digite seu CPF",
                  labelText: "CPF",
                  /*focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                      borderRadius: BorderRadius.circular(12)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                      borderRadius: BorderRadius.circular(12)),*/
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff27b3ff), width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 0),
                    // add padding to adjust icon
                    child: Icon(Icons.account_circle),
                  ),
                ),
                validator: (String cpf) {
                  return cpf.length == 11
                      ? null
                      : 'CPF precisa conter 11 digitos';
                },
                onSaved: (String val) {
                  _cpf = val;
                },
              )),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 30),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 15,
            child: TextFormField(
              obscureText: true,
              validator: (String password) {
                return password.length > 0
                    ? null
                    : 'Senha precisa ser inserida';
              },
              onSaved: (String password) {
                _password = password;
              },
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff27b3ff), width: 1.0),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(12)),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 0),
                  // add padding to adjust icon
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _buildLoginButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 15,
      child: Container(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0),
          ),
          color: Color(0xff27b3ff),
          child: Text('Login',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          onPressed: () {
            _validateInputs(context);
          },
        ),
      ),
    );
  }

  void _validateInputs(context) {
    if (_loginForm.currentState.validate()) {
      _loginForm.currentState.save();
      FocusScope.of(context).unfocus();
      _performLogin(context);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _performLogin(context) async {
    Scaffold.of(context).showSnackBar(
      appSnackBar(
        'Fazendo login...',
        isLoading: true,
      ),
    );
    var loginSucceeded = await performUserLogin(
      _cpf,
      _password,
    );
    Scaffold.of(context).hideCurrentSnackBar();
    if (loginSucceeded) {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      Scaffold.of(context).showSnackBar(
        appSnackBar(
          'Cpf ou senha estão incorretos',
        ),
      );
    }
  }
}
