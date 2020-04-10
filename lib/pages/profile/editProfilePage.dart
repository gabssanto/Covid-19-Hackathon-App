import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/profile/symptomsQuestion.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _EditForm = GlobalKey<FormState>();

  final passKey = GlobalKey<FormFieldState>();

  bool _autoValidate = false;

  bool _obscureText = true;

  String _name;

  String _email;

  String _cpf;

  String _phone;

  int _age;

  String _gender;

  String _cep;

  int _numberOfPeople;

  String _password;

  bool _hasChronicDisease;

  bool _termsChecked = false;

  List selected = [0, 0, 0, 0, 0];

  int yesNo = 0;

  final active = Color(0xff27b3ff);

  final inactive = Color(0xffe8e8e8);

  @override
  void initState() {
    handleQuestions.opacity = false;
    handleQuestions.clearQuestions();
    handleQuestions.questions.add(0);
    print(handleQuestions.questions);
    super.initState();
  }

  @override
  void dispose() {
    if (handleQuestions.questions.length != 0) {
      for (int i = 0; i < handleQuestions.questions.length; i++) {
        handleQuestions.questions.removeAt(i);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: BackAppBar(
        title: 'Editar Perfil',
      ),
      body: Builder(builder: (BuildContext context) {
        return Form(
            key: _EditForm,
            autovalidate: _autoValidate,
            child: ListView(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                _name = val.trim();
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
                                  child: Icon(Icons.email),
                                ),
                              ),
                              validator: (String email) {
                                RegExp pattern = new RegExp(
                                    r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
                                return pattern.hasMatch(email.trim())
                                    ? null
                                    : 'Email inválido';
                              },
                              onSaved: (String val) {
                                _email = val.trim();
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
                                _cpf = val.trim();
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
                                  child: Icon(Icons.phone),
                                ),
                              ),
                              validator: (String telefone) {
                                RegExp pattern = new RegExp(
                                    r'^\(?\d{2,}\)?\s?\d{4,}\-?\d{4}$');
                                return pattern.hasMatch(telefone.trim())
                                    ? null
                                    : 'Número de telefone inválido';
                              },
                              onSaved: (String val) {
                                _phone = val.trim();
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
                                  child: Icon(Icons.cake),
                                ),
                              ),
                              validator: (String idade) {
                                RegExp pattern = new RegExp(r'^\d{1,3}$');
                                return pattern.hasMatch(idade.trim())
                                    ? (() => int.parse(idade.trim()) > 130
                                    ? 'Idade inválida'
                                    : null)()
                                    : 'Idade inválida';
                              },
                              onSaved: (String val) {
                                _age = int.parse(val.trim());
                              },
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 15,
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            isDense: true,
                            value: _gender,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(right: 10.0),
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
                                child: Icon(Icons.wc),
                              ),
                            ),
                            items: ['Masculino', 'Feminino', 'Outro']
                                .map((String gender) => DropdownMenuItem(
                              child: Text(gender),
                              value: gender,
                            ))
                                .toList(),
                            onSaved: (gender) {
                              setState(() {
                                _gender = gender;
                              });
                            },
                            onChanged: (gender) {
                              setState(() {
                                _gender = gender;
                              });
                            },
                            iconEnabledColor: Colors.blueAccent,
                            validator: (value) {
                              return value == null
                                  ? 'Escolha seu gênero'
                                  : null;
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
                                  child: Icon(Icons.location_city),
                                ),
                              ),
                              validator: (String cep) {
                                RegExp pattern = new RegExp(r'^\d{5}-?\d{3}$');
                                return pattern.hasMatch(cep.trim())
                                    ? null
                                    : 'Cep inválido';
                              },
                              onSaved: (String val) {
                                _cep = val.trim();
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
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                hintText: 'Digite sua senha',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
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
                            margin: EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 15,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: new InputDecoration(
                                hintText: "Digite a quantidade de pessoas",
                                labelText: "Número de pessoas",
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
                                  child: Icon(Icons.people),
                                ),
                              ),
                              validator: (String quantidade) {
                                RegExp pattern = new RegExp(r'^\d{1,2}$');
                                return pattern.hasMatch(quantidade.trim())
                                    ? (() => int.parse(quantidade.trim()) > 50
                                    ? 'Quantidade inválida'
                                    : null)()
                                    : 'Quantidade inválida';
                              },
                              onSaved: (String val) {
                                _numberOfPeople = int.parse(val.trim());
                              },
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.15,
                              child: Text('Apresenta alguma doença crônica?',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.154,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 1.18,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: MediaQuery.of(context).size.width / 2.5,
                                      height: MediaQuery.of(context).size.height / 17,
                                      decoration: new BoxDecoration(
                                          color:
                                          handleQuestions.questions[0] == 1
                                              ? active
                                              : inactive,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            handleQuestions.questions[0] == 1 ? yesNo = 0 : yesNo = 1;
                                          });
//                          answer(yesNo);
                                          handleQuestions.setQuestions(0, yesNo);
                                          print(handleQuestions.questions);
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Sim",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: handleQuestions
                                                      .questions[0] ==
                                                      1
                                                      ? Colors.white
                                                      : Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      )),
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: MediaQuery.of(context).size.width / 2.5,
                                      height: MediaQuery.of(context).size.height / 17,
                                      decoration: new BoxDecoration(
                                          color:
                                          handleQuestions.questions[0] == 2
                                              ? active
                                              : inactive,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: FlatButton(
                                        onPressed: () {
                                          setState(() {
                                            handleQuestions.questions[0] == 2 ? yesNo = 0 : yesNo = 2;
                                          });
//                          answer(yesNo);
                                          handleQuestions.setQuestions(0, yesNo);
                                          print(handleQuestions.questions);
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Não",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: handleQuestions
                                                      .questions[0] ==
                                                      2
                                                      ? Colors.white
                                                      : Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.154,
                                                )),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                        handleQuestions.questions[0] == 1 ? SymptomsQuestion(title: 'Qual(is)?', index:1, selected: selected) : Container(),
                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                      child: Text('Salvar',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        this._validateInputs();
                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  height: MediaQuery.of(context).size.height / 15,
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color(0xff27b3ff),
                                      ),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(12.0),
                                      ),
                                      color: Colors.white,
                                      child: Text('Sair da conta',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff27b3ff))),
                                      onPressed: () {

                                      },
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ])),
            ]));
      }),
    );
  }

  void _validateInputs() {
    if (_EditForm.currentState.validate() && _termsChecked) {
      _EditForm.currentState.save();

      handleUser.setForm(_name, _email, _cpf, _phone, _age, _gender, _cep,
          _password, _numberOfPeople, _hasChronicDisease, _termsChecked);

      print(handleUser.toString());

      FocusScope.of(context).unfocus();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
