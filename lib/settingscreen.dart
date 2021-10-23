import 'package:expirybell/languagesscreen.dart';
import 'package:flutter/material.dart';
import 'changepassword.dart';
import 'homescreen.dart';
import 'package:flutter_locales/flutter_locales.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // double viewInset = MediaQuery.of(context).viewInsets.bottom;
    // double defaultLoginSize = size.height - (size.height * 0.2);
    // double defaultSignupSize = size.height - (size.height * 0.2);

    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/2.jpg"), fit: BoxFit.cover)),
      ),
      Container(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              },
                              icon: Icon(Icons.arrow_back)),
                          LocaleText(
                            'Settings',
                            style: TextStyle(fontSize: 25.0),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/2.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            // Padding(
                            //   padding: EdgeInsets.all(10.0),
                            //   child: Container(
                            //     height: 190,
                            //     width: 500,
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 20, vertical: 20),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(20),
                            //         color: Colors.white,
                            //         boxShadow: [
                            //           BoxShadow(
                            //               color: Colors.grey,
                            //               blurRadius: 10.0,
                            //               offset: Offset(0, 10))
                            //         ]),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Align(
                            //           alignment: Alignment.topLeft,
                            //           child: Text(
                            //             "Payment",
                            //             style: TextStyle(
                            //               fontSize: 25,
                            //             ),
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           height: 20.0,
                            //         ),
                            //         Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               child: Icon(
                            //                 Icons.credit_card_outlined,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5.0,
                            //             ),
                            //             Text(" Add Account Details "),
                            //             SizedBox(
                            //               width: 25.0,
                            //             ),
                            //             IconButton(
                            //                 onPressed: () {},
                            //                 icon: Icon(Icons.arrow_forward)),
                            //           ],
                            //         ),
                            //         Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               child: Icon(
                            //                 Icons.credit_card_outlined,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5.0,
                            //             ),
                            //             Text("Add Automatic Payment "),
                            //             SizedBox(
                            //               width: 2.0,
                            //             ),
                            //             IconButton(
                            //               onPressed: () {},
                            //               icon: Icon(
                            //                 Icons.toggle_on,
                            //                 color: Colors.grey,
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 240,
                                width: 500,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: LocaleText(
                                        "Security",
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Icon(Icons.language_outlined),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        LocaleText("Selectlanguage"),
                                        SizedBox(
                                          width: 27.0,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Languages()));
                                            },
                                            icon: Icon(Icons.arrow_forward)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.phone_android_sharp,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        LocaleText("ChangePassword"),
                                        SizedBox(
                                          width: 17.0,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Changepasswordscreen()));
                                            },
                                            icon: Icon(Icons.arrow_forward)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.all(10.0),
                            //   child: Container(
                            //     height: 240,
                            //     width: 500,
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 20, vertical: 20),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(20),
                            //         color: Colors.white,
                            //         boxShadow: [
                            //           BoxShadow(
                            //               color: Colors.grey,
                            //               blurRadius: 10.0,
                            //               offset: Offset(0, 10))
                            //         ]),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Align(
                            //           alignment: Alignment.topLeft,
                            //           child: Text(
                            //             "General",
                            //             style: TextStyle(
                            //               fontSize: 25,
                            //             ),
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           height: 20.0,
                            //         ),
                            //         Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               child: Icon(Icons.language_outlined),
                            //             ),
                            //             SizedBox(
                            //               width: 5.0,
                            //             ),
                            //             Text("Select language"),
                            //             SizedBox(
                            //               width: 60.0,
                            //             ),
                            //             IconButton(
                            //                 onPressed: () {},
                            //                 icon: Icon(Icons.arrow_forward)),
                            //           ],
                            //         ),
                            //         Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               child: Icon(
                            //                 Icons.phone_android_sharp,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5.0,
                            //             ),
                            //             Text("Change Password "),
                            //             SizedBox(
                            //               width: 40.0,
                            //             ),
                            //             IconButton(
                            //                 onPressed: () {
                            //                   Navigator.of(context).push(
                            //                       MaterialPageRoute(
                            //                           builder: (context) =>
                            //                               Changepasswordscreen()));
                            //                 },
                            //                 icon: Icon(Icons.arrow_forward)),
                            //           ],
                            //         ),
                            //         Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           children: [
                            //             Container(
                            //               child: Icon(
                            //                 Icons.phone_android_sharp,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5.0,
                            //             ),
                            //             Text("Manage App Lock "),
                            //             SizedBox(
                            //               width: 40.0,
                            //             ),
                            //             IconButton(
                            //                 onPressed: () {},
                            //                 icon: Icon(Icons.arrow_forward)),
                            //           ],
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10.0,
                            // ),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  color: Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: LocaleText(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ]),
                        ),
                      )
                    ],
                  ))))
    ]));
  }
}
