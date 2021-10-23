import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<LoginApiResponse> apicalllogin(Map<String, dynamic> param) async {
    var url = Uri.parse('http://18.222.67.223/api/auth/login');
    var response = await http.post(url, body: param);
    print('Response status: ${response}');
    print('Response body: ${response.body}');
    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["access_token"], error: data["error"]);
  }
}

class LoginApiResponse {
  final String? token;
  final String? error;

  LoginApiResponse({this.token, this.error});
}
