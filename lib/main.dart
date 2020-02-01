import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/manage_users.dart';
import 'pages/add_product.dart';
import 'pages/soled_products.dart';
import 'package:object_oriented_design_app/ui/views/ShowProfitPage.dart';
import 'pages/login_register.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'vazir'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => Home(),
        '/acceptance': (context) => ManageUsers('مدیریت'),
        '/addNew': (context) => AddProduct(),
        '/soldProducts': (context) => SoledProducts(),
        '/profitPage': (context) => ShowProfitPage(
              token:
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwMjciLCJyb2xlIjoiU2FsZXNtYW4iLCJJZCI6IjEwMjciLCJuYmYiOjE1ODAzNDAzMDYsImV4cCI6MTU4MDk0NTEwNiwiaWF0IjoxNTgwMzQwMzA2fQ.aGQbjP3XUvanqYLUNHfwDyddaOI1HXwozdSLo3KbwbU",
            ),
      },
    ));
