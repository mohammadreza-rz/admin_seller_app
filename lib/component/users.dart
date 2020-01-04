import 'package:flutter/material.dart';

class Users extends StatefulWidget{
  List<bool> itemCheck;
  String numPic;


  Users(this.itemCheck, this.numPic);

  @override
  _UsersState createState() => _UsersState(this.itemCheck, this.numPic);
}

class _UsersState extends State<Users> {
  List<bool> itemCheck;
  String numPic;

  List<String> itemName = [
    'محمد رضوی',
    'حسین اسدی',
    'علی اسدی',
    'احمد اکبری',
    'مریم محمدی',
    'ریحانه احمدی',
    'محمد اسدی پور',
    'فرزانه حیدری',
    'عباس امیری',
    'امیرعباس اسدی',
  ];


  _UsersState(this.itemCheck, this.numPic);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(
            height: 2,
            color: Colors.black,
          ),
      itemCount: 10,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) => Padding(
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
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/' + numPic + '.jpg'),
                    ),
                  ),
                ),
                Text(itemName[index], style: TextStyle(fontSize: 25),)
              ],
            ),
            Switch(
              value: itemCheck[index],
              onChanged: (newVal){
                setState(() {
                  itemCheck[index] = newVal;
                });
              },
            )
          ],
        ),
      ),
    ),
  );
}