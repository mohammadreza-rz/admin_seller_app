import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class AddProductModel{
  String name = '';
  int price ;
  int count ;
  String color = '';
  String description = '';
  String category = 'ندارد';
  bool isStocke = true;
  String string;
  var productImages=[{}];
  String recordTime = '0001-01-01T00:00:00';
  int salesmanId = 1086;
//  var salesman = {};


  save(){
    print('saving');
  }
  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'price': price,
        'count': count,
        'color': color,
        'description': description,
        'productImages': productImages,
        'isStocke' : isStocke,
        'category' : category,
        'recordTime' : recordTime,
        'salesmanId' : salesmanId,
//        'salesman' : salesman,
      };

}