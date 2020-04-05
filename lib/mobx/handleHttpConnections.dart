import 'dart:convert';

import 'package:covid19/global/userInfo.dart';
import 'package:dio/dio.dart';

const String _url = 'https://covid19-backend-node.herokuapp.com';

Future<bool> performUserLogin(String cpf, String password) async {
  var _endPoint = '/api/users/$cpf/$password';
  try {
    var response = await Dio().get(_url + _endPoint);
    var data = response.data;
    globalUser.fromJson(data);
    return (response.statusCode == 200);
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> performUserSignUp(
    UserInfo user, double latitude, double longitude, double precision) async {
  var body = user.toMap(latitude, longitude, precision);
  var _endPoint = '/api/users/';
  try {
    var dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    var response = await dio.post(
      _url + _endPoint,
      data: body,
      options: Options(),
    );
    return (response.statusCode == 201);
  } catch (e) {
    print(e);
    return false;
  }
}
