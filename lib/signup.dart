import 'package:expirybell/api/authenication.dart';
import 'package:expirybell/homescreen.dart';
import 'package:expirybell/loginscreen.dart';
import 'package:expirybell/mobilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/signupapi.dart';
import 'package:expirybell/api/signupapi.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();
  final mobileText = TextEditingController();
  final usernameText = TextEditingController();
  final confirmPassword = TextEditingController();

  bool isHiddenPassword = true;
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
            image: AssetImage("assets/2.jpg"),
          ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 300,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/5.jpg"),
                            ))),
                        Container(
                          height: 80,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            },
                            controller: usernameText,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outlined,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Username",
                                labelText: "Enter you name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 80,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            },
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
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 80,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            },
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
                                labelText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none)),
                            obscureText: isHiddenPassword,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 80,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            },
                            controller: confirmPassword,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 80,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            },
                            controller: mobileText,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone_android_outlined,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "+92 300 000 000",
                                labelText: "Mobile",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 6),
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white.withAlpha(50),
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                callsignup();
                              },
                              color: Color(0xFF47508a),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                        Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Signupscreen()));
                                  },
                                  child: LocaleText(
                                    "Signup",
                                    style: TextStyle(color: Colors.black45),
                                  )),
                              SizedBox(
                                width: size.width * 0.2,
                              ),
                              TextButton(
                                  onPressed: () {},
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
          )
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  callsignup() {
    final service = ApiService();

    service.signupapicall({
      "name": usernameText.text,
      "email": emailText.text,
      "password": passwordText.text,
      "password_confirmation": confirmPassword.text,
      "phone": mobileText.text,
    }).then((value) {
      if (value.error != null) {
        print("get signup error >>>>" + value.error!);
      } else {
        print("get signup user >>>>:  ${value.returnUser}");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));

        // checkToken = true;
      }
    });
  }
}
