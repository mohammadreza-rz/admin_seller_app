import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:object_oriented_design_app/pages/users.dart';


class ManageUsers extends StatefulWidget {
  final String title;

  ManageUsers(this.title);

  @override
  _ManageUsersState createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  List<bool> itemCheck = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  List<bool> itemCheck1 = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Row(textDirection: TextDirection.rtl, children: <Widget>[
        Text(widget.title, style: TextStyle(fontSize: 30))
      ])),

      body: FutureBuilder(
//      future: _fetchData(),
        builder: (context, dataSchedule){
//        if(dataSchedule.hasError) {
//          print(dataSchedule.error);
//          return Center(child: Text("مشکل در برقرار ارتباط با سرور"));
//        }
//
//        if(dataSchedule.hasData){

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                child: Container(
                  child: TabBar(
                      tabs: [
                        Text('فروشندگان', style: TextStyle(fontSize: 25)),
                        Text('همه کاربران', style: TextStyle(fontSize: 25)),
                      ]
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                preferredSize: Size.fromHeight(60),
              ),

              body: TabBarView(
                  children: [
                    Center(child: new Users(itemCheck, '1')),
                    Center(child: new Users(itemCheck1, '2')),
                  ]
              ),
            ),
          );
//        }
//        else
//          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
