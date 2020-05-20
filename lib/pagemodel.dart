import 'package:flutter/material.dart';
class PageModel{
  String _title;
  String _desc;
  IconData _icon;
  String _image;
  PageModel(this._title,this._desc,this._icon,this._image);
  String get title => _title;
  String get desc =>  _desc;
  IconData get icon =>  _icon;
  String get image  =>  _image;
}