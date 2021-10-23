import 'package:expirybell/homescreen.dart';
import 'package:expirybell/loginscreen.dart';
import 'package:expirybell/settingscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class ResetPasswordChange extends StatefulWidget {
  const ResetPasswordChange({Key? key}) : super(key: key);

  @override
  _ResetPasswordChangeState createState() => _ResetPasswordChangeState();
}

class _ResetPasswordChangeState extends State<ResetPasswordChange> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailText = TextEditingController();
  final newpasswordText = TextEditingController();
  final confirmpassText = TextEditingController();
  final oldpassword = TextEditingController();
  String value = "Text";
  bool isHiddenPassword = true;
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
                            height: 250,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/5.jpg"),
                            ))),
                        Container(
                          child: LocaleText(
                            "ResetPassword",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                            controller: oldpassword,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_open,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Old Password",
                                labelText: "Enter your Password",
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
                            controller: newpasswordText,
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
                                labelText: "New Password",
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
                            controller: confirmpassText,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password",
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        Text(newpasswordText.text),
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
                                // validate();
                                if (oldpassword.text == oldpassword.text) {
                                  oldpassword.text = newpasswordText.text;
                                  newpasswordText.text = confirmpassText.text;
                                }
                                // oldpassword.text = newpasswordText.text;
                                // newpasswordText.text = confirmpassText.text;
                                setState(() {});
                              },
                              color: Color(0xFF47508a),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: LocaleText(
                                "Reset",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
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

  void validate() {
    if (formkey.currentState!.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    } else
      print("invalid");
  }
}
