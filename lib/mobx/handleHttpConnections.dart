import 'package:covid19/global/userInfo.dart';
import 'package:dio/dio.dart';

const String _url = 'https://covid19-backend-node.herokuapp.com';

Future<bool> performUserLogin(String cpf, String password) async {
  var _endPoint = '/api/users/$cpf/$password';
  try {
    var response = await Dio().get(_url + _endPoint);
    var data = response.data;
    globalUser.fromJson(data);
    print(globalUser);
    return (response.statusCode == 200);
  } catch (e) {
    print(e);
    return false;
  }
}