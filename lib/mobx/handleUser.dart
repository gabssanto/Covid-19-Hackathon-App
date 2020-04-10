import 'dart:async';

import 'package:mobx/mobx.dart';
part 'handleUser.g.dart';

class HandleUser = _HandleUserBase with _$HandleUser;

abstract class _HandleUserBase with Store {
  @observable
  String userID;

  @observable
  String name;

  @observable
  String email;

  @observable
  String cpf;

  @observable
  String phone;

  @observable
  int age;

  @observable
  String gender;

  @observable
  String cep;

  @observable
  String password;

  @observable
  int numberOfPeople;

  @observable
  // Array com 5 possições que indicam quais sao as doenças cronicas que o usuario tem;
  List chronicDiseases;

  @observable
  bool termsChecked;

  @action
  void setForm(
      String name,
      String email,
      String cpf,
      String phone,
      int age,
      String gender,
      String cep,
      String password,
      int numberOfPeople,
      List chronicDiseases,
      bool termsChecked) {
    this.name = name;
    this.email = email;
    this.cpf = cpf;
    this.phone = phone;
    this.age = age;
    this.cep = cep;
    this.gender = gender;
    this.numberOfPeople = numberOfPeople;
    this.chronicDiseases = chronicDiseases;
    this.password = password;
    this.termsChecked = termsChecked;
  }

  Map<String, dynamic> toJson() {
    bool toBoolean(int val) {
      return val == 0 ? false : true;
    }

    return {
      'nome': name,
      'email': email,
      'cpf': cpf,
      'telefone': phone,
      'idade': age,
      'cep': cep,
      'genero': gender,
      'residentes': numberOfPeople,
      'doencas_cronicas': {
        'diabetes': toBoolean(chronicDiseases[0]),
        'hipertensao': toBoolean(chronicDiseases[1]),
        'insuficiencia_cardiaca': toBoolean(chronicDiseases[2]),
        'insuficiencia_renal': toBoolean(chronicDiseases[3]),
        'respiratoria': toBoolean(chronicDiseases[4]),
      },
      'senha': password,
    };
  }
}
