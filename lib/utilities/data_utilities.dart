import 'package:flutter/material.dart';
import'package:timeago/timeago.dart' as timeago;
Widget loading(){
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ) ,
  );
}
Widget connectionError(){
  return Container(
    padding: EdgeInsets.all(16),
    child:Text('connection error ') ,
  );
}
Widget error(var error){
  return Container(
    padding: EdgeInsets.all(16),
    child:Text(error.toString()) ,
  );
}
Widget noData(){
  return Container(
    padding: EdgeInsets.all(16),
    child:Text('no data available') ,
  );
}
String parseHumanDateTime(String dateTime ){
  Duration timeAgo = new DateTime.now().difference(DateTime.parse(dateTime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);
  return timeago.format(theDifference);
}