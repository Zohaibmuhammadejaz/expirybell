import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'api/AddProductApi.dart';
import 'homescreen.dart';
import 'package:flutter_locales/flutter_locales.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final category = ['Grocery', 'Documents', 'Events', 'Medicine'];

  String? categoryName;

  DropdownMenuItem<String> buildMenuItem(String category) => DropdownMenuItem(
      value: category,
      child: Text(
        category,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ));

  File? image;
  var imagePath = "";
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      // print("iiiimmmmaaageeeeee: ${image}");
      if (image == null) return;

      final imageTemporary = File(image.path);
      imagePath = image.path;
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var titleText = TextEditingController();
  var categoryIdText = TextEditingController();
  var expiryDataText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultSignupSize = size.height - (size.height * 0.2);

    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/2.jpg"), fit: BoxFit.cover)),
      ),
      Container(
          child: Center(
              child: ListView(children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: Icon(Icons.arrow_back)),
              LocaleText(
                "Category",
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/2.jpg"), fit: BoxFit.cover)),
        ),
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: LocaleText(
                      'AddImage',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                image != null
                    ? Image.file(
                        image!,
                        width: size.width * 0.8,
                        height: 160,
                        fit: BoxFit.cover,
                      )
                    : FlutterLogo(
                        size: 100,
                      ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(0, 10))
                        ]),
                    child: RaisedButton(
                      onPressed: () => pickImage(ImageSource.gallery),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.image_outlined,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          LocaleText(
                            "ChooseImage",
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: LocaleText(
                      'Title',
                      // textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: 3),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
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
                    controller: titleText,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        // hintText: "Title",
                        // labelText: "Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                      alignment: Alignment.center,
                      child: LocaleText(
                        "Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.symmetric(vertical: 3),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(0, 10))
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: categoryName,
                          isExpanded: true,
                          hint: Text("Select Category"),
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black,
                          ),
                          items: category.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.categoryName = value)),
                    )),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: LocaleText(
                      'ExpiryDate',
                      // textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: 3),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
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
                    controller: expiryDataText,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Date",
                        labelText: "2021-10-01",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                        callSaveProduct();
                      },
                      color: Color(0xFF47508a),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: LocaleText(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              ]),
        ))
      ])))
    ]));
  }

  callSaveProduct() {
    final service = ApiService();
    var categoryId = "";
    if (categoryName == "Grocery") {
      categoryId = "6";
    } else if (categoryName == "Documents") {
      categoryId = "7";
    } else if (categoryName == "Events") {
      categoryId = "5";
    } else if (categoryName == "Medicine") {
      categoryId = "4";
    }
    service.saveProductApiCall({
      "categoryid": categoryId,
      "name": titleText.text,
      "image": Image.file(
        File(imagePath),
      ),
      "expirydate": expiryDataText.text,
      // "expirydate": DateTime.now(),
    }).then((value) {
      if (value.error != null) {
        print("get Save Product error >>> ${value.error}");
      } else {
        print("get Saved Product >>>>:  ${value.message}");
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => HomeScreen()));

      }
    });
  }
}
