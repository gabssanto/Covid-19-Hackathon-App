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
  String age;

  @observable
  String gender;

  @observable
  String cep;

  @observable
  String numberOfPeople;

  @observable
  String chronicDisease;

  @observable
  String password;

  @observable
  bool termsChecked;

  @action
  void setForm(name, email, cpf, phone, age, gender, cep, numberOfpeople,
      chronicDisease, password, termsChecked) {
    this.name = name;
    this.email = email;
    this.cpf = cpf;
    this.phone = phone;
    this.age = age;
    this.cep = cep;
    this.numberOfPeople = numberOfPeople;
    this.chronicDisease = chronicDisease;
    this.password = password;
    this.termsChecked = termsChecked;
  }
}
