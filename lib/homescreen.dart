import 'package:expirybell/api/logoutApi.dart';
import 'package:expirybell/categoryscreen.dart';
import 'package:expirybell/loginscreen.dart';
import 'package:expirybell/main.dart';
import 'package:expirybell/productscreen.dart';
import 'package:expirybell/profilescreen.dart';
import 'package:expirybell/settingscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            )));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title as String),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body as String)],
                  ),
                ),
              );
            });
      }
    });
  }

  void _shownotifications() {
    setState(() {
      _counter++;
      flutterLocalNotificationsPlugin.show(
          0,
          'Testing $_counter',
          "How you doing",
          NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  importance: Importance.high,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher')));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultSignupSize = size.height - (size.height * 0.2);

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Drawer(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 50.0),
                  child: ListView(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.menu,
                            color: Colors.blueAccent,
                          ),
                          // suffixIcon: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {},
                          //       icon: Icon(
                          //         FontAwesomeIcons.facebook,
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //     IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(FontAwesomeIcons.twitter,
                          //             color: Colors.grey)),
                          //     IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(FontAwesomeIcons.instagram,
                          //             color: Colors.grey)),
                          //   ],
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.greenAccent.shade400,
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                LocaleText(
                                  "Profile",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.indigo.shade900,
                                  child: Icon(
                                    Icons.home_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                LocaleText(
                                  "Home",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Productscreen()));
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.tealAccent.shade700,
                                  child: Icon(
                                    Icons.search_off_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                LocaleText(
                                  "Product",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.lightBlue.shade400,
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                LocaleText(
                                  "Notifications",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade900,
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                LocaleText(
                                  "Settings",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.lime,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                LocaleText(
                                  "Close",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                SizedBox(
                                  height: 10.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade50,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      )));
            },
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  _shownotifications();
                },
                icon: Icon(FontAwesomeIcons.bell)),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 43,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                callLogoutFunction();
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 43,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Icon(
                    Icons.logout_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/2.jpg"), fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18.0,
                    ),
                    LocaleText(
                      "welcome",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    LocaleText(
                      "expirybell",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.lightBlue.shade50),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 175,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff0acc8c),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30.0,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xff0acc8c),
                                        radius: 20.0,
                                        child: Icon(
                                          Icons.local_grocery_store_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  LocaleText(
                                    "Grocery",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  LocaleText(
                                    "101Items",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 175,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffff5949),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30.0,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xffff5949),
                                        radius: 20.0,
                                        child: Icon(
                                          Icons.document_scanner_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  LocaleText(
                                    "Documents",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  LocaleText(
                                    "101Items",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 175,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffebab47),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30.0,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xffebab47),
                                        radius: 20.0,
                                        child: Icon(
                                          FontAwesomeIcons.clinicMedical,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  LocaleText(
                                    "Medicines",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  LocaleText(
                                    "101Items",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 175,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff2f26db),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30.0,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xff2f26db),
                                        radius: 20.0,
                                        child: Icon(
                                          Icons.event_note_sharp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  LocaleText(
                                    "Events",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  LocaleText(
                                    "101Items",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Category()));
                              },
                              color: Colors.lightBlue.shade50,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_outlined,
                                    color: Colors.blue.shade800,
                                  ),
                                  LocaleText(
                                    "Addnewitem",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 162,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.lightBlue.shade100,
                                    child: Icon(
                                      Icons.home_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  LocaleText(
                                    "Home",
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 160,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade900,
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                LocaleText(
                                  "Settings",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  callLogoutFunction() {
    final service = Logout();

    service.callLogoutApi().then((value) {
      if (value.message == null) {
        print("Logout Failed");
      } else {
        print("get Logout Mseeage >>>>:  ${value.message}");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));

        // checkToken = true;
      }
    });
  }
}
