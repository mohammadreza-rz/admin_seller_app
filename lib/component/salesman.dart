import 'package:flutter/material.dart';
import 'package:object_oriented_design_app/server/user.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';

class SalesMan extends StatefulWidget {
  SalesMan();

  @override
  _SalesManState createState() => _SalesManState();
}

class _SalesManState extends State<SalesMan> {
  List<bool> itemCheck;
  String numPic;
  List<dynamic> list;

  _SalesManState();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getSalesManInfo(),
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
            itemCount: data['items'].toList().length,
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
    Uint8List bytes;
    if (list[index]['profileImage'] != null)
      bytes = base64.decode(list[index]['profileImage'].substring(23));

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
                      child: Container(
                        child: bytes == null
                            ? Image.asset('assets/images/1.jpg')
                            : Image.memory(bytes),
                      ),
                    ),
                  ),
                  Text(
                    list[index]['name'] != null
                        ? list[index]['name']
                        : 'نامی ندارد',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Switch(
                value: list[index]['suspend'],
                onChanged: (newVal) {
                  setState(() {
                    toggleSuspend(list[index]['id']);
                    list[index]['suspend'] = newVal;
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
