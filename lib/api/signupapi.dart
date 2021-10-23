import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<SignupapiResponse> signupapicall(Map<String, dynamic> param) async {
    try {
      var url = Uri.parse('http://18.222.67.223/api/auth/register');
      var response = await http.post(url, body: param);
      print('Response status: ${response}');
      print('Response body: ${response.body}');
      final data = jsonDecode(response.body);

      return SignupapiResponse(returnUser: data["user"], error: null);
    } catch (e) {
      return SignupapiResponse(returnUser: null, error: "Signup Failed");
    }
  }
}

class SignupapiResponse {
  var returnUser;
  final String? error;

  SignupapiResponse({this.returnUser, this.error});
}
