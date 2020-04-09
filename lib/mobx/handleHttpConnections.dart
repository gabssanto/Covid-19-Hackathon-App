import 'package:covid19/global/userInfo.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:dio/dio.dart';

// para acessar o localhost da máquina é com esse ip: http://10.0.2.2:PORT
const String _devUrl = 'http://10.0.2.2:3333';
// const String _prodUrl = 'https://covid19-backend-node.herokuapp.com';

Future<bool> performUserLogin(String cpf, String password) async {
  var _endPoint = '/api/users/$cpf/$password';
  try {
    var response = await Dio().get(_devUrl + _endPoint);
    if (response.statusCode == 200) {
      globalUser = UserInfo.fromJson(response.data['message']);
      return true;
    }
    throw Exception(response.data['message']);
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> performUserSignUp() async {
  final userBody = handleUser.toJson();
  var _endPoint = '/api/users/';
  var dio = new Dio();
  dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  try {
    var response = await dio.post(
      _devUrl + _endPoint,
      data: userBody,
    );
    if (response.statusCode == 201) {
      globalUser = UserInfo.fromJson(response.data['message']);
      return true;
    }
    throw Exception(response.data['message']);
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> performUserUpdate(String cpf, String password) async {
  final userBody = handleUser.toJson();
  var _endPoint = '/api/users/$cpf/$password';
  var dio = new Dio();
  dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  try {
    //var response = await Dio().get(_devUrl + _endPoint);
    var response = await dio.put(
      _devUrl + _endPoint,
      data: userBody,
    );
    if (response.statusCode == 200) {
      globalUser = UserInfo.fromJson(response.data['message']);
      return true;
    }
    throw Exception(response.data['message']);
  } catch (e) {
    print(e);
    return false;
  }
}