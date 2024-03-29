import 'package:covid19/global/appSnackBar.dart';
import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/handleHttpConnections.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/home/home_page.dart';
import 'package:covid19/pages/signup/constants.dart';
import 'package:covid19/pages/signup/widgets/BtnSignup.dart';
import 'package:covid19/pages/signup/widgets/chronicDiseasesQuestion.dart';
import 'package:covid19/pages/signup/widgets/field.dart';
import 'package:flutter/material.dart';

import '../../mobx/imports.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignUpPage> {
  final _signupFormKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
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
  bool _termsChecked = false;

  List _selectedChronicDiseases = [0, 0, 0, 0, 0];
  int _yesNo = 0;

  @override
  void initState() {
    super.initState();
    handleQuestions.opacity = false;
    handleQuestions.clearQuestions();
    handleQuestions.questions.add(0);
    handleQuestions.questions.add([0, 0, 0, 0, 0]);
  }

  @override
  void dispose() {
    if (handleQuestions.questions.length != 0) {
      for (int i = 0; i < handleQuestions.questions.length; i++) {
        handleQuestions.questions.removeAt(i);
      }
    }
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackAppBar(
          title: 'Cadastre-se',
        ),
        body: SingleChildScrollView(
          child: Builder(builder: (BuildContext context) {
            return Form(
                key: _signupFormKey,
                autovalidate: _autoValidate,
                child: Column(children: <Widget>[
                  Container(
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
                            _buildBasicInfoFields(context),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Localização',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff27b3ff))),
                            _buildLocalizationFields(context),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Segurança',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff27b3ff))),
                            _buildSecurityFields(context),
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
                            _buildAditionalInfoFields(context),
                            handleQuestions.questions[0] == 1
                                ? ChronicDiseasesQuestion(
                                    title: 'Qual(is)?',
                                    index: 1,
                                    selected: _selectedChronicDiseases)
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Termos e condições',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff27b3ff))),
                            CheckboxListTile(
                              activeColor: Theme.of(context).accentColor,
                              title: Text(
                                  'Eu li e concordo com os termos de serviço e uso'),
                              value: _termsChecked,
                              onChanged: (bool value) {
                                setState(() => _termsChecked = value);
                                if (value) {
                                  WidgetsBinding
                                      .instance.focusManager.primaryFocus
                                      ?.unfocus();
                                }
                              },
                              subtitle: !_termsChecked
                                  ? Padding(
                                      padding: EdgeInsets.only(left: 12.0),
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
                              text: "Finalizar Cadastro",
                              color: _termsChecked
                                  ? ConstantsSignupPage.activeButtonColor
                                  : ConstantsSignupPage.inactiveButtonColor,
                              onPressed: () {
                                WidgetsBinding
                                    .instance.focusManager.primaryFocus
                                    ?.unfocus();
                                _validateInputs(context);
                              },
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 10),
                            ),
                          ])),
                ]));
          }),
        ));
  }

  _buildBasicInfoFields(context) {
    return Column(
      children: <Widget>[
        SignupFormField(
          hint: 'Digite seu nome',
          label: 'Nome',
          icon: Icon(Icons.person),
          validator: (String nome) {
            RegExp pattern =
                new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
            return pattern.hasMatch(nome.trim()) ? null : 'Nome inválido';
          },
          onSaved: (String val) {
            _name = val.trim();
          },
        ),
        SignupFormField(
          hint: "Digite seu e-mail",
          label: "Email",
          icon: Icon(Icons.email),
          inputType: TextInputType.emailAddress,
          validator: (String email) {
            RegExp pattern = new RegExp(
                r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
            return pattern.hasMatch(email.trim()) ? null : 'Email inválido';
          },
          onSaved: (String val) {
            _email = val.trim();
          },
        ),
        SignupFormField(
          hint: "Digite seu CPF",
          label: "CPF",
          icon: Icon(Icons.person),
          inputType: TextInputType.number,
          validator: (String cpf) {
            RegExp pattern = new RegExp(r'^\d{3}\.?\d{3}\.?\d{3}\-?\d{2}$');
            return pattern.hasMatch(cpf.trim())
                ? (() {
                    cpf = cpf.trim().replaceAll(new RegExp(r'[-\.]'), '');
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
                      soma < 2 ? digito2 = 0 : digito2 = 11 - soma;
                    }
                    return digito1 == int.parse(cpf[9]) &&
                            digito2 == int.parse(cpf[10])
                        ? null
                        : 'CPF inválido';
                  })()
                : 'CPF inválido';
          },
          onSaved: (String val) {
            _cpf = val.replaceAll(new RegExp(r'[-\.]'), '').trim();
          },
        ),
        SignupFormField(
          hint: "Digite seu telefone",
          label: "Telefone",
          icon: Icon(Icons.phone),
          inputType: TextInputType.phone,
          validator: (String telefone) {
            RegExp pattern = new RegExp(r'^\(?\d{2,}\)?\s?\d{4,}\-?\d{4}$');
            return pattern.hasMatch(telefone.trim())
                ? null
                : 'Número de telefone inválido';
          },
          onSaved: (String val) {
            _phone = val.replaceAll(new RegExp(r'[\(\)-\s+]'), '').trim();
          },
        ),
        SignupFormField(
          hint: "Digite sua idade",
          label: "Idade",
          icon: Icon(Icons.cake),
          inputType: TextInputType.number,
          validator: (String idade) {
            RegExp pattern = new RegExp(r'^\d{1,3}$');
            return pattern.hasMatch(idade.trim())
                ? (() =>
                    int.parse(idade.trim()) > 130 ? 'Idade inválida' : null)()
                : 'Idade inválida';
          },
          onSaved: (String val) {
            _age = int.parse(val.trim());
          },
        ),
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
                  borderSide: BorderSide(color: Color(0xff27b3ff), width: 1.0),
                  borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
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
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            iconEnabledColor: Colors.blueAccent,
            validator: (value) {
              return value == null ? 'Escolha seu gênero' : null;
            },
          ),
        ),
      ],
    );
  }

  _buildLocalizationFields(context) {
    return SignupFormField(
      hint: 'Digite seu CEP',
      label: 'CEP',
      icon: Icon(Icons.location_city),
      inputType: TextInputType.number,
      validator: (String cep) {
        RegExp pattern = new RegExp(r'^\d{5}-?\d{3}$');
        return pattern.hasMatch(cep.trim()) ? null : 'CEP inválido';
      },
      onSaved: (String val) {
        _cep = val.replaceAll(new RegExp(r'[-\s+]'), '').trim();
      },
    );
  }

  _buildSecurityFields(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SignupFormField(
            controller: _passController,
            obscureText: _obscureText,
            label: 'Senha',
            hint: 'Digite sua senha',
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            icon: Icon(Icons.lock),
            validator: (String password) {
              return password.length > 6
                  ? null
                  : 'senha deve ter mais de 6 digítos';
            },
            onSaved: (String val) {
              _password = val;
            },
          ),
          SignupFormField(
            obscureText: true,
            label: 'Confirme a senha',
            hint: 'Confirme a senha',
            icon: Icon(Icons.lock),
            validator: (String password) {
              return _passController.text == password
                  ? null
                  : 'As senhas devem ser iguais';
            },
          )
        ]);
  }

  _buildAditionalInfoFields(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Quantas pessoas residem com você na sua casa?',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              letterSpacing: -0.154,
            ),
          ),
          SignupFormField(
            hint: "Digite a quantidade de pessoas",
            label: "Número de pessoas",
            icon: Icon(Icons.people),
            inputType: TextInputType.number,
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
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 17,
                        decoration: new BoxDecoration(
                            color: handleQuestions.questions[0] == 1
                                ? ConstantsSignupPage.activeButtonColor
                                : ConstantsSignupPage.inactiveButtonColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              WidgetsBinding.instance.focusManager.primaryFocus
                                  ?.unfocus();
                              handleQuestions.questions[0] == 1
                                  ? _yesNo = 0
                                  : _yesNo = 1;
                            });
                            handleQuestions.setQuestions(0, _yesNo);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Sim",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: handleQuestions.questions[0] == 1
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
                            color: handleQuestions.questions[0] == 2
                                ? ConstantsSignupPage.activeButtonColor
                                : ConstantsSignupPage.inactiveButtonColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: FlatButton(
                          onPressed: () {
                            WidgetsBinding.instance.focusManager.primaryFocus
                                ?.unfocus();
                            setState(() {
                              handleQuestions.questions[0] == 2
                                  ? _yesNo = 0
                                  : _yesNo = 2;
                            });
                            handleQuestions.setQuestions(0, _yesNo);
                            _selectedChronicDiseases = [0, 0, 0, 0, 0];
                            handleQuestions.setQuestions(
                                1, _selectedChronicDiseases);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Não",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: handleQuestions.questions[0] == 2
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
          )
        ]);
  }

  _validateInputs(context) {
    if (_signupFormKey.currentState.validate() && _termsChecked) {
      _signupFormKey.currentState.save();

      print('$_cpf, $_phone');
      handleUser.setForm(_name, _email, _cpf, _phone, _age, _gender, _cep,
          _password, _numberOfPeople, _selectedChronicDiseases, _termsChecked);

      _performSignup(context);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  _performSignup(context) async {
    Scaffold.of(context).showSnackBar(
      appSnackBar(
        'Fazendo cadastro...',
        isLoading: true,
      ),
    );
    var signupSucceeded = await performUserSignUp();
    Scaffold.of(context).hideCurrentSnackBar();
    if (signupSucceeded) {
      var loginSucceeded = await performUserLogin(
        _cpf,
        _password,
      );
      if (loginSucceeded) {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } else {
      Scaffold.of(context).showSnackBar(
        appSnackBar(
          'Erro interno no servidor',
        ),
      );
    }
  }
}
