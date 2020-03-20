// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handleLogin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HandleLogin on _HandleLoginBase, Store {
  final _$loginAtom = Atom(name: '_HandleLoginBase.login');

  @override
  Login get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(Login value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$_HandleLoginBaseActionController =
      ActionController(name: '_HandleLoginBase');

  @override
  void createNewUser(dynamic name, dynamic cpf, dynamic password) {
    final _$actionInfo = _$_HandleLoginBaseActionController.startAction();
    try {
      return super.createNewUser(name, cpf, password);
    } finally {
      _$_HandleLoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'login: ${login.toString()}';
    return '{$string}';
  }
}
