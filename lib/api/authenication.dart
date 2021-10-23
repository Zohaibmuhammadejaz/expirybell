import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  Future<ReturnAuthentication> auth() async {
    getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('authToken');
    }

    var token = await getToken();
    // var token = null;
    // print("tokeeeeennnnneeennn: " + token.toString());

    var url = Uri.parse('http://18.222.67.223/api/auth/user-profile');
    try {
      var response = await http
          .get(url, headers: {"Authorization": "Bearer " + token.toString()});
      print('Response body: ${response.body}');
      Map<String, dynamic> data = jsonDecode(response.body);
      // final data = jsonDecode(response.body);
      return ReturnAuthentication(checkLogin: true, userData: data);
    } catch (e) {
      print('Response error in token: ${e}');
      return ReturnAuthentication(checkLogin: false, userData: null);
    }
  }
}

class ReturnAuthentication {
  final bool checkLogin;
  var userData;

  ReturnAuthentication({this.checkLogin = false, this.userData});
}
