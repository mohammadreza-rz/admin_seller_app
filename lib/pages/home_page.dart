import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String title = "";
  String imageUrl = "assets/images/background.jpg";
  double price = 1200;
  String description = "";

  void _incrementCounter() {
    setState(() {});
  }

  _showWarningAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('آیا از حدف این محصول اطمینان دارین؟'),
            content: Text('این محصول قابل بازگردانی نمیباشد.'),
            actions: <Widget>[
              FlatButton(
                child: Text('کنسل'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('حدف'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Widget _buildProductImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: Image.asset(imageUrl, width: 150, height: 150, fit: BoxFit.fill),
    );
  }

  Widget _buildProductTitle(String title, String description) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
//    List<Map<String, dynamic>> products;
//    products = getProducts();
    return Scaffold(
      appBar: AppBar(title: Text('مدیریت فروشگاه')),
      body: new Products(),
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
                title: Text('ورود و ثبت نام'),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
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

class Products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Products();
}

class _Products extends State<Products> {
  List<dynamic> list;

  getProducts() async {
    String url = 'http://198.143.182.157/api/Products/GetAll';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwNDgiLCJyb2xlIjoiQWRtaW4iLCJJZCI6IjEwNDgiLCJuYmYiOjE1ODAzNzExOTMsImV4cCI6MTU4MDk3NTk5MywiaWF0IjoxNTgwMzcxMTkzfQ.lV_HA4Bi_imrPNC7zm4lDIA41nwDr7IWvcGvVCvdxbY"
    };

    String productBody =
        '{"sortColumn": "id","order": "des","take": 30,"skip": 0,"expressionFilters": []}';
    Response response = await post(url, body: productBody, headers: headers);
    final body = json.decode(utf8.decode(response.bodyBytes));

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProducts(),
      builder: (context, snapData) {
        if (snapData.hasError) {
          print(snapData.error);
          return Center(child: Text('مشکل در برقرار ارتباط با سرور'));
        }
        if (snapData.hasData) {
          var data = snapData.data;

          list = data['items'];

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.blue,
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
    Uint8List imgBytes;
    if (list[index]['productImages'] != null)
      imgBytes = base64.decode(list[index]['productImages'][0]['imageContent']);

      return Padding(
        padding: EdgeInsets.all(8),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: imgBytes == null
                        ? Image.asset('assets/images/background.jpg')
                        : Image.memory(imgBytes).fit,
                  ),
                ),
                Text(
                  list[index]['name'] != null
                      ? list[index]['name']
                      : 'بدون نام',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                ),
                Text(
                  list[index]['description'] != null
                      ? list[index]['description']
                      : 'بدون شرح',
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.right,
                ),
                Text(
                  'قیمت کالا: ${list[index]['price'] != null ? list[index]['price'].toString() : 'بدون قیمت'}',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      );
  }
}
