// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handleUser.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HandleUser on _HandleUserBase, Store {
  final _$nameAtom = Atom(name: '_HandleUserBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_HandleUserBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$cpfAtom = Atom(name: '_HandleUserBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.context.enforceReadPolicy(_$cpfAtom);
    _$cpfAtom.reportObserved();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.context.conditionallyRunInAction(() {
      super.cpf = value;
      _$cpfAtom.reportChanged();
    }, _$cpfAtom, name: '${_$cpfAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_HandleUserBase.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$ageAtom = Atom(name: '_HandleUserBase.age');

  @override
  String get age {
    _$ageAtom.context.enforceReadPolicy(_$ageAtom);
    _$ageAtom.reportObserved();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.context.conditionallyRunInAction(() {
      super.age = value;
      _$ageAtom.reportChanged();
    }, _$ageAtom, name: '${_$ageAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_HandleUserBase.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$streetAtom = Atom(name: '_HandleUserBase.street');

  @override
  String get street {
    _$streetAtom.context.enforceReadPolicy(_$streetAtom);
    _$streetAtom.reportObserved();
    return super.street;
  }

  @override
  set street(String value) {
    _$streetAtom.context.conditionallyRunInAction(() {
      super.street = value;
      _$streetAtom.reportChanged();
    }, _$streetAtom, name: '${_$streetAtom.name}_set');
  }

  final _$numberOfPeopleAtom = Atom(name: '_HandleUserBase.numberOfPeople');

  @override
  String get numberOfPeople {
    _$numberOfPeopleAtom.context.enforceReadPolicy(_$numberOfPeopleAtom);
    _$numberOfPeopleAtom.reportObserved();
    return super.numberOfPeople;
  }

  @override
  set numberOfPeople(String value) {
    _$numberOfPeopleAtom.context.conditionallyRunInAction(() {
      super.numberOfPeople = value;
      _$numberOfPeopleAtom.reportChanged();
    }, _$numberOfPeopleAtom, name: '${_$numberOfPeopleAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_HandleUserBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$_HandleUserBaseActionController =
      ActionController(name: '_HandleUserBase');

  @override
  void setForm1(
      dynamic name, dynamic email, dynamic cpf, dynamic phone, dynamic age) {
    final _$actionInfo = _$_HandleUserBaseActionController.startAction();
    try {
      return super.setForm1(name, email, cpf, phone, age);
    } finally {
      _$_HandleUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setForm2(
      dynamic city, dynamic street, dynamic numberOfpeople, dynamic password) {
    final _$actionInfo = _$_HandleUserBaseActionController.startAction();
    try {
      return super.setForm2(city, street, numberOfpeople, password);
    } finally {
      _$_HandleUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},email: ${email.toString()},cpf: ${cpf.toString()},phone: ${phone.toString()},age: ${age.toString()},city: ${city.toString()},street: ${street.toString()},numberOfPeople: ${numberOfPeople.toString()},password: ${password.toString()}';
    return '{$string}';
  }
}
