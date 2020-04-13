import 'package:covid19/global/locationInfo.dart';
import 'package:covid19/global/userInfo.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _LOCAL_EMULATOR_URL = 'http://10.0.2.2';
const _LOCAL_SERVER_PORT = 3333;
const _PROD_URL = 'https://covid19-backend-node.herokuapp.com';

const _isDev = true;
const _apiUrl = _isDev ? '$_LOCAL_EMULATOR_URL:$_LOCAL_SERVER_PORT' : _PROD_URL;
final _storage = FlutterSecureStorage();

Future<bool> performUserLogin(String cpf, String password) async {
  var _endPoint = '/api/users/$cpf/$password';
  var dio = new Dio();

  try {
    await _storage.write(
        key: 'jwt_token', value: await _getJwtToken(cpf, password));

    dio.options.headers['Authorization'] =
        'Bearer ${await _storage.read(key: 'jwt_token')}';
    var response = await dio.get(_apiUrl + _endPoint);
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

Future<String> _getJwtToken(String cpf, String password) async {
  var dio = new Dio();
  var response = await dio.get(_apiUrl + '/authenticate/$cpf/$password');
  if (response.statusCode == 200) {
    return response.data['message'];
  }
  throw Exception(response.data['message']);
}

Future<bool> performUserSignUp() async {
  final userBody = handleUser.toJson();
  globalLocation.name = 'Local de Cadastro';
  userBody['local_registro'] = globalLocation.toJson();
  var _endPoint = '/api/users/';
  var dio = new Dio();
  dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  try {
    var response = await dio.post(
      _apiUrl + _endPoint,
      data: userBody,
    );
    if (response.statusCode == 201) {
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
  dio.options.headers['Authorization'] =
      'Bearer ${await _storage.read(key: 'jwt_token')}';
  dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  try {
    var response = await dio.put(
      _apiUrl + _endPoint,
      data: userBody,
    );
    if (response.statusCode == 202) {
      globalUser = UserInfo.fromJson(userBody);
      return true;
    }
    throw Exception(response.data['message']);
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> performAutoAvaliation() async {
  final formBody = handleQuestions.toJson();
  var _endPoint = '/api/forms/';
  var dio = new Dio();
  dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  try {
    var response = await dio.post(
      _apiUrl + _endPoint,
      data: formBody,
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
