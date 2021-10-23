import 'package:expirybell/signup.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'homescreen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 75,
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
                      child: IntlPhoneField(
                        decoration: InputDecoration(hintText: "Phone Number"),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (phone) {
                          print('Country code changed to: ' +
                              phone.countryCode.toString());
                        },
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Container(
                    //       width: 120,
                    //       child: CountryCodePicker(
                    //         initialSelection: 'Pakistan',
                    //         showCountryOnly: false,
                    //         showOnlyCountryWhenClosed: false,
                    //         favorite: ['92', 'Pakistan'],
                    //         hideSearch: true,
                    //         alignLeft: true,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                                builder: (context) => HomeScreen()));
                          },
                          color: Color(0xFF47508a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text("Or Signup now"),
                    ),
                    SizedBox(
                      height: 10.0,
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
                                builder: (context) => Signupscreen()));
                          },
                          color: Color(0xFF47508a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Signupscreen()));
                                },
                                child: Text(
                                  "Signup",
                                  style: TextStyle(color: Colors.black45),
                                )),
                            SizedBox(
                              width: size.width * 0.3,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Forget Password?",
                                    style: TextStyle(color: Colors.black45))),
                          ],
                        ),
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
