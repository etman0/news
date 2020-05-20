import 'dart:math';

import 'package:flutter/material.dart';
class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList =[
    Colors.cyan.shade500,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.pinkAccent,
    Colors.green,
    Colors.indigo
  ];
  Random random= Random();
  Color _getRandomColor(){
    return colorsList[random.nextInt(colorsList.length)];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,position){
return Card(
child: Container(
  padding: EdgeInsets.all(16),
  child: Column(
    children: <Widget>[
          _authorRow(),
          SizedBox(
            height:16
          ),
          _newsItemRow()
             

  ],)
),
);
    },
    itemCount:20 ,
    );
  }

  Widget _authorRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/m1.jpg') , fit: BoxFit.cover
                  ) ,
                  shape: BoxShape.circle
                  ),
                
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right:16 ),
                  ),
                Column(
                 
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text('michael adams',
                 style:TextStyle(
                   color: Colors.black87
                 ) 
                 ,),
                 SizedBox(height:8 ,),
                Row(
                  children: <Widget>[
                    Text('23 min , ' ,style:TextStyle(
                   color: Colors.black87
                 ) ,),
                    Text('life style', style:TextStyle(
                   color: _getRandomColor()
                 ) ,),
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border), 
          onPressed: (){},
          color: Colors.grey,
          
          )
        
      ],
    );
  }
  Widget _newsItemRow(){
    return Row(
children: <Widget>[
  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('assets/images/m4.jpg'),fit: BoxFit.cover)
    ),
    width: 124,
    height: 124,
    margin: EdgeInsets.only(right:16),
  ),
  Expanded(
      child: Column(
      children: <Widget>[
        Text('ycyhtcyk 7tfytf tyvit tg k  kytkftvkfv',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600
        ) ,),
  Text('jccrc tycytcjtc jyttyckt kutktfyfy y k ytfyjfktfkt  ktftfktfkt k tktfktf',
   style: TextStyle(
     color: Colors.blue,
fontSize: 16,
height: 1.25
   ),)
      ],
    ),
  )
],
    );
  }
}