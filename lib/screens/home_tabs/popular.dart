import 'package:flutter/material.dart';
import 'package:news/api/posts_api.dart';
import 'package:news/models/post.dart';
import 'package:news/utilities/data_utilities.dart';
import 'dart:async';

import '../single_post.dart';
class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsAPI postsAPI = PostsAPI();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: postsAPI.fetchPostsByCategoryId("3"),
      builder:  (context, AsyncSnapshot snapShot ){
      switch (snapShot.connectionState){
        case ConnectionState.none:
          return connectionError();
          break;
        case ConnectionState.waiting:
          return loading();
          break;
        case ConnectionState.active:
          return loading();
          break;
        case ConnectionState.done:
          if(snapShot.hasError){
            return error(snapShot.error);
          }else{
            List<Post> posts = snapShot.data;
            return ListView.builder(
              itemBuilder:(context,position ){
                return Card(
                    child: _drawSingleRow(posts[position])
                );
              } ,
              itemCount: posts.length,
            );
          }

          break;

      }


      },

    );
  }
   Widget _drawSingleRow(Post post){
       return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute( builder:(context){
                       return SinglePost(post);
                     } ));
                   },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: <Widget>[
                        SizedBox(
                          width: 124,
                          height: 124,
                          child: Image(image:
                        NetworkImage(post.featuredImage),
                         fit: BoxFit.cover,)
                         ),
                         SizedBox(
                           width: 16,
                         ),
                         Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                             children: <Widget>[
             Text(post.content, maxLines: 6,
             style: TextStyle(
               fontSize:18,
               fontWeight: FontWeight.w600
             ),
             ),

                    SizedBox(
                          height: 18,
                                 ),        
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('sen sanders'),
                               Row(
      
                                 children: <Widget>[
                                 Icon(Icons.timer),
                                 Text(parseHumanDateTime(post.dateWritten))
                               ],
                               )
                              ],
                            ) ],
                           ),
                         )
                      ],
                    ),
                  ),
                );
      }
}