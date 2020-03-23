import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/generalAppBar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(title: 'Perfil',),
      body: Container(
        height: double.infinity,
        color: Color(0xffefefef),
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height - 120,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5,bottom: 5),
                        child: Icon(Icons.account_circle, size: 80, color: Colors.black54,),
                      ),
                      Text("Gabriel Alves",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xff27b3ff),
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.231,

                          )
                      ),
                      Text("Supeito de Covid-19",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xffffb027),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.165,

                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Informações Básicas",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff27b3ff),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.165,
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                      labelText: 'Nome',
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
                                        child: Icon(Icons.account_box),
                                      ),
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                      labelText: 'Sobrenome',
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
                                        child: Icon(Icons.account_box),
                                      ),
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                      labelText: 'Idade',
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
                                        child: Icon(Icons.cake),
                                      ),
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                      labelText: 'Idade',
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
                                        child: Icon(Icons.phone),
                                      ),
                                    ),
                                  )),
                              Divider(),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 0, bottom: 0),
                                decoration: BoxDecoration(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Text("Localização",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff27b3ff),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: -0.165,

                                          )
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_right, color: Color(0xff27b3ff),),
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Text("Segurança",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff27b3ff),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.165,
                                    )
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 20,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                      labelText: 'Senha',
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
                                margin: EdgeInsets.only(top: 5, bottom: 15),
                                child: Text("Digite aqui para mudar a senha",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black38,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.132,

                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 18,
                                decoration: new BoxDecoration(
                                    color: Color(0xff27b3ff),
                                    border: Border.all(color: Color(0xff27b3ff)),
                                    borderRadius: BorderRadius.circular(13)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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

                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 18,
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Color(0xff27b3ff)),
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Sair da conta",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff27b3ff),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: -0.176,

                                          )
                                      ),
                                    ],
                                  ),
                              )


                            ],
                          )
                      )

                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
