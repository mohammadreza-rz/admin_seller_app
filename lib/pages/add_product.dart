import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  bool _lights = false;
  String dropdownValue = 'آرایشی و بهداشت';

  @override
  Widget build(BuildContext context) {
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
                              )))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'قیمت'),
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
                                decoration: InputDecoration(labelText: 'تعداد'),
                              ))),
//                      Padding(
//                          padding: EdgeInsets.all(12),
//                          child: new Directionality(
//                              textDirection: TextDirection.rtl,
//                              child: TextFormField(
//                                decoration:
//                                    InputDecoration(labelText: 'دسته بندی'),
//                              ))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'رنگ'),
                              ))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: new Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'توضیحات'),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                              ))),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: RaisedButton(
                              color: Color(0xff33CCFF),
                              child: Text("تایید"),
                              onPressed: () {}))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
