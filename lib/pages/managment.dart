import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';


class Test extends StatefulWidget {
  final String title;

  Test(this.title);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
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
                    Center(child: Text('ok1')),
                    Center(child: Text('pk2')),
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
