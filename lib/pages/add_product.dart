import 'dart:collection';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/addproduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  AddProduct({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final _addProduct = AddProductModel();
  final HashMap<String, String> map = new HashMap<String, String>();
  File image;
  File _image;
  String h;
  String dropdownValue = 'آرایشی و بهداشت';

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
      String base64Image = base64Encode(image.readAsBytesSync());
      print(base64Image.length);
      setState(() {
        _addProduct.productImages = [
          {"imageContent": base64Image}
        ];
      });
    }

//    Future uploadPic(BuildContext context) async {
//      setState(() {
//        print("Profile Picture uploaded");
//        Scaffold.of(context)
//            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//      }
//      );
//    }

    return Scaffold(
        backgroundColor: Color(0xffE0E0E0),
        appBar: AppBar(
          title: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text('فرم'),
            ],
          ),
        ),
        body: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(12),
                    child: Column(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'نام محصول',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'لطفا نام محصول را وارد کنید';
                                    }
                                  },
                                  onSaved: (val) =>
                                      setState(() => _addProduct.name = val)))),

                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'قیمت'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'لطفا قیمت را وارد کنید';
                                  }
                                },
                                onSaved: (val) => setState(
                                    () => _addProduct.price = int.parse(val)),
                                scrollPadding:
                                    EdgeInsets.fromLTRB(12, 12, 12, 12),
                              ))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: DropdownButton<String>(
                                value: dropdownValue,
//                        icon: Icon(Icons.arrow_downward),
//                        iconSize: 24,

                                isExpanded: true,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black54, fontFamily: 'vazir'),
                                underline: Container(
                                  height: 1,
                                  color: Colors.black26,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                    _addProduct.category = newValue;
                                  });
                                },
                                items: <String>[
                                  'آرایشی و بهداشت',
                                  'خانه و آشپزخانه',
                                  'مد و پوشاک',
                                  'کتاب',
                                  'خوردنی'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                  decoration:
                                      InputDecoration(labelText: 'تعداد'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'لطفا تعداد را وارد کنید';
                                    }
                                  },
                                  onSaved: (val) => setState(() =>
                                      _addProduct.count = int.parse(val))))),

                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                  decoration: InputDecoration(labelText: 'رنگ'),
                                  onSaved: (val) => setState(
                                      () => _addProduct.color = val)))),

                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'تاریخ ثبت'),
                                onSaved: (val) => setState(
                                    () => _addProduct.recordTime = val),
                                keyboardType: TextInputType.multiline,
                              ))),
//
//
//                      SizedBox(
//                        height: 20.0,
//                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: image == null
                                ? Text('No image selected.')
                                : Image.file(image,
                                    width: 200, height: 200, fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.camera,
                                size: 30.0,
                              ),
                              onPressed: () {
                                getImage();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'توضیحات'),
                                onSaved: (val) => setState(
                                    () => _addProduct.description = val),
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                              ))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: RaisedButton(
                              color: Color(0xff33CCFF),
                              child: Text("تایید"),
                              onPressed: () {
                                final form = _formKey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  return _makePostRequest(setState, context);
                                }
                              })),
//                      Padding(
//                          padding: EdgeInsets.all(12),
//                          child: RaisedButton(
//                              color: Color(0xff33CCFF),
//                              child: Text("login"),
//                              onPressed: () async {
//                                Map<String, String> headers = {"Content-type": "application/json"};
//                                final response= await http.post('http://198.143.182.157/api/Salesmans/Login',headers: headers, body:{"userName":"username","password":123});
//                                Map<String, dynamic> mapdecode = json.decode(response.body);
//                               cookie= mapdecode['tooken'];
//                                })),
//                      Padding(
//                          padding: EdgeInsets.all(12),
//                          child: RaisedButton(
//                              color: Color(0xff33CCFF),
//                              child: Text("username"),
//                              onPressed: () async {
//                                Map<String, String> headers = {"Content-type": "application/json","Authorization":"Bearer $cookie"};
//                                final response= await http.post('http://198.143.182.157/api/Salesmans/Login',headers: headers, body:{"userName":"username","password":123});
//                                Map<String, dynamic> mapdecode = json.decode(response.body);
//                                cookie= mapdecode['tooken'];
//                              }))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

//  _showDialoge(BuildContext context) {
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text('submittt')));
//  }

  Future _makePostRequest(StateSetter state, BuildContext context) async {
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwNDgiLCJyb2xlIjoiQWRtaW4iLCJJZCI6IjEwNDgiLCJuYmYiOjE1ODAzNzExOTMsImV4cCI6MTU4MDk3NTk5MywiaWF0IjoxNTgwMzcxMTkzfQ.lV_HA4Bi_imrPNC7zm4lDIA41nwDr7IWvcGvVCvdxbY"
      };
      String jsonPost = jsonEncode(_addProduct);

      final response = await http
          .post('http://198.143.182.157/api/Products/Insert',
              headers: headers, body: jsonPost)
          .then((http.Response response) {
        print("oooook : ${_addProduct.productImages}");
      }).catchError((onError) {
        print("Error: $onError");
      });
    } catch (e) {
      print("Exception Caught: $e");
    }
  }
}
