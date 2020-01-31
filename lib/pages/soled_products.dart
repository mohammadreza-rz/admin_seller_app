import 'package:flutter/material.dart';

class SoledProducts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowSoldProducts();
}

class ShowSoldProducts extends State<SoledProducts> {
  final List<String> products = <String>['اسباب بازی', 'مداد', 'گوشی'];
  final List<String> productStatus = [
    'سفارش ثبت شد',
    'سفارش ثبت شد',
    'سفارش ثبت شد'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text('لیست فروخته شده ها'),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text(products[index]),
                  DropdownButton(
                    style: TextStyle(),
                    value: productStatus[index],
                    items: <String>[
                      'سفارش ثبت شد',
                      'آماده سازی',
                      'تحویل به پست'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Text(
                              value,
                              style: TextStyle(
                                  color: Colors.black, fontFamily: 'vazir'),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String selectedValue) {
                      setState(() {
                        productStatus[index] = selectedValue;
                      });
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}