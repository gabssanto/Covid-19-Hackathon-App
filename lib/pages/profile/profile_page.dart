import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/userInfo.dart';
import 'package:flutter/material.dart';

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
        color: Color(0xffefefef),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height - 350,
              decoration: new BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text("Supeito de Covid-19",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xffffb027),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.165,
                                  )),
                            ),
                          ],
                        ),
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
                                globalUser.name,
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
                                globalUser.cpf,
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
                                globalUser.telephone,
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
                                globalUser.age.toString(),
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
                                "Gênero:",
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
                                globalUser.gender,
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
                                "${globalUser.residents} pessoas moram comigo",
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
                                globalUser.cep,
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
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: new BoxDecoration(
                            color: Color(0xff27b3ff),
                            border: Border.all(
                              color: Color(0xff27b3ff),
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Editar Perfil",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.176,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xff27b3ff),
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Sair da conta",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff27b3ff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.176,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateInputs() {}
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
