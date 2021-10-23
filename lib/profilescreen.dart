import 'dart:convert';

import 'package:expirybell/api/authenication.dart';
import 'package:expirybell/api/updateProfileApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homescreen.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_locales/flutter_locales.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

enum SocialMedia { facebook, twitter, instagram }

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => getUserData());
  }

  var userName = "";

  var emailText = TextEditingController();
  var mobileText = TextEditingController();
  var usernameText = TextEditingController();

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
                    image: AssetImage("assets/2.jpg"), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      width: size.width * 0.8,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                              LocaleText(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          image != null
                              ? ClipOval(
                                  child: Image.file(
                                    image!,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.grey.shade400,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 80,
                                          )),
                                      Positioned(
                                          right: -15,
                                          bottom: 0,
                                          child: RawMaterialButton(
                                            onPressed: () =>
                                                pickImage(ImageSource.gallery),
                                            elevation: 10,
                                            fillColor: Colors.white,
                                            padding: EdgeInsets.all(7),
                                            shape: CircleBorder(),
                                            child:
                                                Icon(Icons.camera_alt_outlined),
                                          ))
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            userName,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final url = "https://www.facebook.com";
                                  if (await canLaunch(url)) {
                                    await launch(url,
                                        forceSafariVC: true,
                                        forceWebView: true,
                                        enableJavaScript: true);
                                  }
                                  ;
                                  // share(SocialMedia.facebook);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    final url = "https://twitter.com";
                                    if (await canLaunch(url)) {
                                      await launch(url,
                                          forceSafariVC: true,
                                          forceWebView: true,
                                          enableJavaScript: true);
                                    }
                                  },
                                  icon: Icon(FontAwesomeIcons.twitter,
                                      color: Colors.grey)),
                              IconButton(
                                  onPressed: () async {
                                    final url = "https://www.instagram.com";
                                    if (await canLaunch(url)) {
                                      await launch(
                                        url,
                                        forceSafariVC: true,
                                        forceWebView: true,
                                        enableJavaScript: true,
                                      );
                                    }
                                  },
                                  icon: Icon(FontAwesomeIcons.instagram,
                                      color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 80,
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
                    child: TextField(
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
                    height: 78,
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
                      controller: mobileText,
                      decoration: InputDecoration(
                        hintText: "0000000000",
                        border: InputBorder.none,
                      ),
                      initialCountryCode: 'PK',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (phone) {
                        print('Country code changed to: ' +
                            phone.countryCode.toString());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white.withAlpha(50),
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          callProfileUpdateFunction();
                        },
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: LocaleText(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future share(SocialMedia socialPlatform) async {
    final subject = "";
    final text = "";
    final urlshare = Uri.encodeComponent("https://www.facebook.com");

    final urls = {
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlshare&text=$text',
    };
    final url = urls[socialPlatform]!;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void getUserData() {
    final Service = Authentication();
    Service.auth().then((value) {
      if (value.checkLogin) {
        print("LOGIN STATUSSSSS  >>>>: ${value.checkLogin}");
        print("USERRR DATAAAAA >>>>: ${value.userData}");
        var userProfileData = value.userData;
        print("USER PROFILE DATA >>>>>: $userProfileData");
        setState(() => {
              usernameText.text = userProfileData["name"].toString(),
              emailText.text = userProfileData["email"].toString(),
              mobileText.text = userProfileData["phone"].toString(),
              userName = userProfileData["name"].toString()
            });
      } else {
        print("LOGIN STATUSSSSS >>>>: ${value.checkLogin}");
      }
    });
  }

  callProfileUpdateFunction() {
    final service = ApiService();
    service.profileUpdateapicall({
      "name": usernameText.text,
      "phone": mobileText.text,
    }).then((value) {
      if (value.error == null) {
        // print("Profile Update Success Message >>>>>>>>>>>>" + value.message!);
        // print("Updated User Profile ${value.returnUser}");
        // var updatedProfileData = value.returnUser;
        // print("Updated USER PROFILE DATA >>>>>: $updatedProfileData");
        // setState(() => {
        //       usernameText.text = updatedProfileData["name"].toString(),
        //       emailText.text = updatedProfileData["email"].toString(),
        //       mobileText.text = updatedProfileData["phone"].toString(),
        //       userName= updatedProfileData["name"].toString()
        //     });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print("get Update Ptofile Error >>>>");
        print(value.error!);
      }
    });
  }
}
