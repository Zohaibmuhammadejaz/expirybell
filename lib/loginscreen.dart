import 'dart:convert';
import 'dart:developer';
import 'package:expirybell/api/apiservice.dart';
import 'package:expirybell/api/authenication.dart';
import 'package:expirybell/homescreen.dart';
import 'package:expirybell/resetpassword.dart';
import 'package:expirybell/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  bool isHiddenPassword = true;
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => validate());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultSignupSize = size.height - (size.height * 0.2);

    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/1.jpg"),
          ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 82,
                          margin: EdgeInsets.symmetric(vertical: 3),
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: TextFormField(
                            controller: emailText,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Email",
                                labelText: "Enter you email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 82,
                          margin: EdgeInsets.symmetric(vertical: 3),
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: TextFormField(
                              controller: passwordText,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: Colors.black,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(
                                      isHiddenPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hintText: "Password",
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none)),
                              obscureText: isHiddenPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                          height: 58,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white.withAlpha(50),
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              callloginapi();
                            },
                            color: Color(0xFF47508a),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: LocaleText(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )),
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Signupscreen()));
                                },
                                child: LocaleText(
                                  "Signup",
                                  style: TextStyle(color: Colors.black45),
                                )),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ResetPasswordScreen()));
                                },
                                child: LocaleText("ForgetPassword",
                                    style: TextStyle(color: Colors.black45))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setToken(tokenValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', tokenValue);
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  callloginapi() {
    final service = ApiService();
    String token = '';

    service.apicalllogin({
      "email": emailText.text,
      "password": passwordText.text,
    }).then((value) {
      if (value.token != null) {
        token = value.token.toString();
        setToken(token);
        validate();
      } else {
        print("get login error >>>>" + value.error!);

        // checkToken = true;
      }
    });
  }

  void validate() {
    final Service = Authentication();
    Service.auth().then((value) {
      if (value.checkLogin) {
        print("LOGIN STATUSSSSS  >>>>: ${value.checkLogin}");
        // print("USERRR DATAAAAA >>>>: ${value.userData}");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print("LOGIN STATUSSSSS >>>>: ${value.checkLogin}");

        // print("USERRR DATAAAAA >>>>: ${value.userData}");
      }
    });
  }
}
