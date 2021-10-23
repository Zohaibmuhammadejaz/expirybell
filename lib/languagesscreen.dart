import 'package:expirybell/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/2.jpg"), fit: BoxFit.cover)),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: ListView(children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                        },
                        icon: Icon(Icons.arrow_back)),
                    LocaleText(
                      'ChangeLanguage',
                      style: TextStyle(fontSize: 25.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () => LocaleNotifier.of(context)!.change('en'),
                    child: Text(
                      "English",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => LocaleNotifier.of(context)!.change('ur'),
                  child: Text("اردو",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => LocaleNotifier.of(context)!.change('it'),
                  child: Text("Italiano",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => LocaleNotifier.of(context)!.change('es'),
                  child: Text("Español",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ]))
        ]));
  }
}
