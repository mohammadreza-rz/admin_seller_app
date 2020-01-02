import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/manage_users.dart';
import 'pages/add_product.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'vazir'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/acceptance': (context) => ManageUsers('مدیریت'),
        '/addNew': (context) => AddProduct(),
      },
    ));


