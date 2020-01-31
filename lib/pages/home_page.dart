import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مدیریت فروشگاه')),
      body: Center(
        child: Text('از منو سمت چپ انتخاب کنید'),
      ),
      drawer: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
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
              Divider(
                height: 2,
                color: Colors.black,
              ),
              ListTile(
                title: Text('مدیریت کاربران'),
                onTap: () {
                  Navigator.pushNamed(context, '/acceptance');
                },
              ),

              Divider(
                height: 2,
                color: Colors.black,
              ),
              ListTile(
                title: Text('افزودن کالا'),
                onTap: () {
                  Navigator.pushNamed(context, '/addNew');
                },
              ),

              Divider(
                height: 2,
                color: Colors.black,
              ),
              ListTile(
                title: Text('اجناس فروخته شده'),
                onTap: () {
                  Navigator.pushNamed(context, '/soldProducts');
                },
              ),

              Divider(
                height: 2,
                color: Colors.black,
              ),
              ListTile(
                  title: Text('مشاهده سود'),
                  onTap: () {
                    Navigator.pushNamed(context, '/profitPage');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
