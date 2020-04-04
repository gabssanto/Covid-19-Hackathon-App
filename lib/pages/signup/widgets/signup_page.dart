import 'package:covid19/global/loginAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/signup/widgets/BtnSignup.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignUpPage> {
  final GlobalKey<FormState> _signupForm1 = GlobalKey<FormState>();
  final passKey = GlobalKey<FormFieldState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _cpf;
  String _phone;
  String _age;
  String _gender;
  String _cep;
  String _numberOfPeople;
  String _password;
  bool _hasChronicDisease;
  bool _termsChecked = false;

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
            key: _signupForm1,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
                reverse: true,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Informações Básicas',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff27b3ff))),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  hintText: "Digite seu nome",
                                  labelText: "Nome",
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
                                    child: Icon(Icons.person),
                                  ),
                                ),
                                validator: (String nome) {
                                  RegExp pattern = new RegExp(
                                      r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                                  return pattern.hasMatch(nome.trim())
                                      ? null
                                      : 'Nome inválido';
                                },
                                onSaved: (String val) {
                                  _name = val;
                                },
                              )),
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
                                  _email = val;
                                },
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                  hintText: "Digite seu CPF",
                                  labelText: "CPF",
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
                                    child: Icon(Icons.person),
                                  ),
                                ),
                                validator: (String cpf) {
                                  RegExp pattern = new RegExp(
                                      r'^\d{3}\.?\d{3}\.?\d{3}\-?\d{2}$');
                                  return pattern.hasMatch(cpf.trim())
                                      ? (() {
                                          cpf = cpf.trim().replaceAll(
                                              new RegExp(r'[-\.]'), '');
                                          int soma = 0;
                                          var digito1;
                                          var digito2;
                                          var j = 10;
                                          for (int i = 0; i < 9; i++) {
                                            soma += int.parse(cpf[i]) * j;
                                            j--;
                                          }
                                          soma %= 11;
                                          soma < 2
                                              ? digito1 = 0
                                              : digito1 = 11 - soma;
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
                                onSaved: (String val) {
                                  _cpf = val;
                                },
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: new InputDecoration(
                                  hintText: "Digite seu telefone",
                                  labelText: "Telefone",
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
                                    child: Icon(Icons.phone),
                                  ),
                                ),
                                validator: (String telefone) {
                                  RegExp pattern = new RegExp(
                                      r'\(?\d{2,}\)?\s?\d{4,}\-?\d{4}');
                                  return pattern.hasMatch(telefone.trim())
                                      ? null
                                      : 'Número de telefone inválido';
                                },
                                onSaved: (String val) {
                                  _phone = val;
                                },
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 15,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  hintText: "Digite sua idade",
                                  labelText: "Idade",
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
                                    child: Icon(Icons.cake),
                                  ),
                                ),
                                validator: (String idade) {
                                  RegExp pattern = new RegExp(r'\d{1,3}');
                                  return pattern.hasMatch(idade.trim())
                                      ? (() => int.parse(idade.trim()) > 130
                                          ? 'Idade inválida'
                                          : null)()
                                      : 'Idade inválida';
                                },
                                onSaved: (String val) {
                                  _age = val;
                                },
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 15,
                            child: DropdownButtonFormField(
                              value: _gender,
                              decoration: new InputDecoration(
                                hintText: "Selecionar gênero",
                                labelText: "Gênero",
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
                                  child: Icon(Icons.person),
                                ),
                              ),
                              items: ['Masculino', 'Feminino', 'Outro']
                                  .map((String gender) => DropdownMenuItem(
                                        child: Text(gender),
                                        value: gender,
                                      ))
                                  .toList(),
                              onChanged: (gender) {
                                setState(() {
                                  _gender = gender;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                                  hintText: 'Digite seu cep',
                                  labelText: 'Cep',
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
                                      : 'Cep inválido';
                                },
                                onSaved: (String val) {
                                  _cep = val;
                                },
                              )),
                          SizedBox(
                            height: 15,
                          ),
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
                                  _password = val;
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
                          SizedBox(
                            height: 15,
                          ),
                          Text('Informações Adicionais',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff27b3ff))),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Quantas pessoas residem com você na sua casa?',
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15),
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
                                onSaved: (String val) {
                                  _numberOfPeople = val;
                                },
                              )),
                          Text(
                            'Apresenta alguma doença crônica?',
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 15,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: 154,
                                      height: 35,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe8e8e8),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Sim",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black38,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: 154,
                                      height: 35,
                                      decoration: new BoxDecoration(
                                          color: Color(0xffe8e8e8),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Não",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black38,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CheckboxListTile(
                            activeColor: Theme.of(context).accentColor,
                            title: Text(
                                'Eu li e concordo com os termos de serviço e uso'),
                            value: _termsChecked,
                            onChanged: (bool value) =>
                                setState(() => _termsChecked = value),
                            subtitle: !_termsChecked
                                ? Padding(
                                    padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                    child: Text(
                                      'Campo necessário',
                                      style: TextStyle(
                                          color: Color(0xFFe53935),
                                          fontSize: 12),
                                    ),
                                  )
                                : null,
                          ),
                          Container(margin: EdgeInsets.only(top: 30)),
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
    if (_signupForm1.currentState.validate() && _termsChecked) {
      _signupForm1.currentState.save();

      handleUser.setForm(_name, _email, _cpf, _phone, _age, _gender, _cep,
          _numberOfPeople, _hasChronicDisease, _password, _termsChecked);

      print(handleUser.toString());
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
