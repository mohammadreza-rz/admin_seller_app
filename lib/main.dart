import 'package:flutter/material.dart';
import 'pages/managment.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHome(),
        '/acceptance': (context) => Test('مدیریت'),
//        '/addNew': (context) => MyHomePage(),
      },
    ));


class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مدیریت فروشگاه')),
      body: Center(
        child: Text('test'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('مدیریت فروشگاه'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('تایید صلاحیت'),
              onTap: () {
                Navigator.pushNamed(context, '/acceptance');
//                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('افزودن کالا'),
              onTap: () {
                Navigator.pushNamed(context, '/addNew');
//                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

