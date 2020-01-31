import 'package:flutter/material.dart';
import 'package:object_oriented_design_app/server/user.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';

class Customer extends StatefulWidget {

  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  List<dynamic> list;

  _CustomerState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCustomerInfo(),
      builder: (ctx, snapData) {
        if (snapData.hasError) {
          print(snapData.error);
          return Center(child: Text('مشکل در برقرار ارتباط با سرور'));
        }

        if (snapData.hasData) {
          var data = snapData.data;

          list = data['items'];

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 2,
              color: Colors.black,
            ),
            itemCount: list.length,
            itemBuilder: _buildItem,
          );
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
//    Uint8List bytes;
//    if (list[index]['profileImage'] != null)
//      bytes = base64.decode(list[index]['profileImage'].substring(23));

    return Padding(
      padding: EdgeInsets.all(8),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Container(
                      height: 85,
                      width: 85,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/1.jpg')
                      ),
                    ),
                  ),
                  Text(
                    list[index]['userName'], //!= null
//                        ? list[index]['name']
//                        : 'نامی ندارد',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Switch(
                value: true,
                onChanged: (newVal) {
                  setState(() {

                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
