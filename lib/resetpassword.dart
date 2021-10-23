import 'package:expirybell/changepassword.dart';
import 'package:expirybell/schangepassword.dart';
import 'package:expirybell/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'homescreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      child: LocaleText(
                        "ResetPassword",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
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
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Useremail",
                            labelText: "Verify Your email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Container(
                        height: 60,
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResetPasswordChange()));
                          },
                          color: Color(0xFF47508a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: LocaleText(
                            "Verify",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            width: size.width * 0.3,
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
          )
        ],
      ),
    );
  }
}
