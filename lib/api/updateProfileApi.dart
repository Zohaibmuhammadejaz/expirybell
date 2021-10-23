import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<ProfileUpdateapiResponse> profileUpdateapicall(
      Map<String, dynamic> param) async {
    getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('authToken');
    }

    var token = await getToken();
    try {
      var url = Uri.parse('http://18.222.67.223/api/auth/profileupdate');
      var response = await http.post(url,
          body: param,
          headers: {"Authorization": "Bearer " + token.toString()});
      // print('Response status: ${response}');
      // print('Response body: ${response.body}');
      final data = jsonDecode(response.body);

      return ProfileUpdateapiResponse(
          returnUser: data["user"], message: data["message"], error: null);
    } catch (e) {
      return ProfileUpdateapiResponse(
          returnUser: null, message: null, error: e);
    }
  }
}

class ProfileUpdateapiResponse {
  var returnUser;
  final String? message;
  var error;

  ProfileUpdateapiResponse({this.returnUser, this.message, this.error});
}
