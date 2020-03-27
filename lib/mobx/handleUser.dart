import 'package:firebase_auth/firebase_auth.dart';
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
    signUp();
  }

  @action
  login(email, password) async {
    String res = await signIn(email, password);
    this.userID = res;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signUp() async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: this.email, password: this.password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}
