import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel{
  String _id;
  String _name;
  String _lname;
  String _phoneNum;
  //  and ...

  UserModel(this._id, this._name, this._lname, this._phoneNum);

  String get phoneNum => _phoneNum;

  set phoneNum(String value) {
    _phoneNum = value;
  }

  String get lname => _lname;

  set lname(String value) {
    _lname = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


}