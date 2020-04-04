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
  String city;

  @observable
  String street;

  @observable
  String numberOfPeople;

  @observable
  String password;

  @action
  void setForm1(name, email, cpf, phone, age) {
    this.name = name;
    this.email = email;
    this.cpf = cpf;
    this.phone = phone;
    this.age = age;
  }

  @action
  void setForm2(city, street, numberOfpeople, password) {
    this.city = city;
    this.street = street;
    this.numberOfPeople = numberOfPeople;
    this.password = password;
  }

}
