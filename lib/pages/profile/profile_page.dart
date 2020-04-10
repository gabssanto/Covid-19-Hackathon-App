import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/userInfo.dart';
import 'package:flutter/material.dart';

import 'editProfilePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> _profileForm = GlobalKey<FormState>();
  bool _autoValidate = false;
  final passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    print(globalUser.toString());
    return Scaffold(
      appBar: BackAppBar(
        title: 'Perfil',
      ),
      body: Container(
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Informações',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff27b3ff))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Nome:",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          'globalUser.name',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "CPF:",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          'globalUser.cpf',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Telefone:",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          'globalUser.telephone',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Idade:",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(

                          'globalUser.age',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "${'globalUser.residents'} pessoas moram comigo",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "CEP:",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          'globalUser.neighborhood',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
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
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                                color: Color(0xff27b3ff),
                                child: Text('Editar Perfil',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                                },
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Container(
                                    child: Text("Segurança",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff27b3ff),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.165,
                                        ),),
                                  ),
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
                                          _senha = val;
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

                                  Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 15),
                                    child: Text("Digite aqui para mudar a senha",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.132,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    decoration: new BoxDecoration(
                                        color: Color(0xff27b3ff),
                                        border:
                                            Border.all(color: Color(0xff27b3ff)),
                                        borderRadius: BorderRadius.circular(13)),
                                    child: FlatButton(
                                      onPressed: () {
                                        if (_profileForm.currentState.validate()) {
                                          _profileForm.currentState.save();
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                        } else {
                                          setState(() {
                                            _autoValidate = true;
                                          });
                                        }
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Salvar",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: -0.176,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
 */
