import 'package:dio/dio.dart';

const String url = 'https://covid19-backend-node.herokuapp.com';

Future<bool> loginUser() async {
  try {
    var response = await Dio().get("http://www.google.com");
    print(response);
    return (response.statusCode == 200);
  } catch (e) {
    print(e);
    return false;
  }
}