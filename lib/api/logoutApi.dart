import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Logout {
  Future<ReturnSignoutResponse> callLogoutApi() async {
    getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('authToken');
    }

    var token = await getToken();
    var url = Uri.parse('http://18.222.67.223/api/auth/logouts');
    try {
      var response = await http
          .post(url, headers: {"Authorization": "Bearer " + token.toString()});
      print('Response body: ${response.body}');
      final data = jsonDecode(response.body);
      return ReturnSignoutResponse(message: data["message"]);
    } catch (e) {
      return ReturnSignoutResponse(
        message: null,
      );
    }
  }
}

class ReturnSignoutResponse {
  String? message;

  ReturnSignoutResponse({this.message = null});
}
