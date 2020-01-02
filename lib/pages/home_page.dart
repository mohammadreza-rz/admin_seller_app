import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
              child: Center(
                child: Text('مدیریت فروشگاه'),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('پروفایل'),
              onTap: () {},
            ),
            ListTile(
              title: Text('مدیریت کاربران'),
              onTap: () {
                Navigator.pushNamed(context, '/acceptance');
              },
            ),
            ListTile(
              title: Text('افزودن کالا'),
              onTap: () {
                Navigator.pushNamed(context, '/addNew');
              },
            ),
            ListTile(
              title: Text('اجناس فروخته شده'),
              onTap: (){
                Navigator.pushNamed(context, '/soldProducts');
              },
            )
          ],
        ),
      ),
    );
  }
}
