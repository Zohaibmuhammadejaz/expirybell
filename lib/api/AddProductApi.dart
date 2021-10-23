import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<SaveProductApiResponse> saveProductApiCall(
      Map<String, dynamic> param) async {
    getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('authToken');
    }

    var token = await getToken();
    try {
      var url = Uri.parse('http://18.222.67.223/api/auth/saveproduct');
      var response = await http.post(url, body: param, headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + token.toString()
      });
      final data = jsonDecode(response.body);

      return SaveProductApiResponse(message: data["message"], error: null);
    } catch (e) {
      return SaveProductApiResponse(message: null, error: e);
    }
  }
}

class SaveProductApiResponse {
  var error;
  var message;

  SaveProductApiResponse({this.message, this.error});
}
