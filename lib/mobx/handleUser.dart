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
  bool chronicDisease;

  @observable
  bool termsChecked;

  @action
  void setForm(name, email, cpf, phone, age, gender, cep, password,
      numberOfPeople, chronicDisease, termsChecked) {
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
