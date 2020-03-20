import 'package:mobx/mobx.dart';
part 'handleLogin.g.dart';

class HandleLogin = _HandleLoginBase with _$HandleLogin;

abstract class _HandleLoginBase with Store {
  @observable
  Login login;

  @action
  void createNewUser(name, cpf, password) {
    login = Login(name: name, cpf: cpf, password: password);
  }
}

class Login {
  var name = null;
  var cpf = null;
  var password = null;
  Login({this.name, this.cpf, this.password});
}
