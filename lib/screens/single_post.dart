import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/post.dart';

class SinglePost extends StatefulWidget {
 final Post post;
  @override
  _SinglePostState createState() => _SinglePostState();

  SinglePost(this.post);
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace:FlexibleSpaceBar(

              background: Container(
                decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.post.featuredImage),
                    fit:BoxFit.cover )
                ),
              ),
            ) ,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context,position){
              if(position == 0){
                return _drawPostDetails();
              }else if(position >= 1 && position < 24){
                return _comments();
              }else {
               return _commentTextEntry();
              }

            },childCount: 25),
          )
        ],
      ),
    );
  }

  Color getRandomColor({int minBrightness = 50}) {
    final random = Random();
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }
Widget  _drawPostDetails(){
    return Container(
      padding: EdgeInsets.all(16),
         child: Text(widget.post.content,
         style:TextStyle(fontSize:18,
         letterSpacing: 1.2,
           height: 1.25
         ) ,
         ),
    );

  }
  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(widget.post.featuredImage) ,
              ),
              SizedBox(
                width:16 ,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('christina'),
                  Text('1 min'),

                ],
              )
            ],
          ),
          SizedBox(
            width:16 ,
          ),
          Text('tfytf ytfytf tfjytf tftftftftyftftftftfytfytf ',),
        ],
      ),
    );
  }
  Widget _commentTextEntry(){
    return Container(

      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(

                 decoration: InputDecoration(

                   border: InputBorder.none,
                   hintText: 'comment here',
                   fillColor:Colors.grey[400],
                   filled: true,
                   contentPadding: EdgeInsets.only(left: 16,top: 24,bottom:28 )
                 ) ,
                ),
              ),
             SizedBox(width: 10,),
              FlatButton(onPressed: null,

                child: Text('submit',style: TextStyle(color:Colors.redAccent ),),
            //  color:Colors.lightBlueAccent ,
              disabledColor:Colors.lightBlueAccent
  )
            ],
          ),
          SizedBox(
            height:8 ,
          ),
        ],
      ),
    );
  }
}
