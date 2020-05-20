import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/posts_api.dart';
import 'dart:async';

import 'package:news/utilities/data_utilities.dart';
import 'package:news/models/post.dart';

import '../single_post.dart';
class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsAPI postsAPI = PostsAPI();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _drawHeader(),
        _drawTopStories(),
        _drawRecentUpdates()
              ],
              ),
            );
          }
          Widget _drawHeader(){
            TextStyle _headerTitle = TextStyle(
              color: Colors.tealAccent,
              fontSize: 22,
              fontWeight: FontWeight.w600
            );
             TextStyle _headerDescription = TextStyle(
                color: Colors.tealAccent,
                fontSize: 18
             );
            return FutureBuilder(
              future:postsAPI.fetchPostsByCategoryId("1") ,
              builder: (context, AsyncSnapshot snapshot ){
                switch (snapshot.connectionState){
                  case ConnectionState.waiting:
                    return _loading();
                    break;
                  case ConnectionState.active:
                    return _loading();
                    break;
                  case ConnectionState.none:
                    return _connectionError();
                    break;
                  case ConnectionState.done:
                    if(snapshot.error != null){
                      return error(snapshot.error);
                    }else{
                      List<Post> posts = snapshot.data;
                      Random random = Random();
                      int randomIndex = random.nextInt(posts.length);
                      Post post = posts[randomIndex];
                      return InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute( builder:(context){
                            return SinglePost(post);
                          } ));
                        } ,
                          child:Container(
                        width: MediaQuery.of(context).size.width,

                        height: MediaQuery.of(context).size.height * 0.25 ,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(post.featuredImage),
                                fit:BoxFit.cover
                            )
                        ),
                        child: Center(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left:48,right: 48),
                                  child: Text(
                                    post.title,
                                    style: _headerTitle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left:34,right: 34),
                                  child: Text(
                                    post.content.substring(0,75)/*,maxLines: 5*/,
                                    style:_headerDescription ,
                                    textAlign: TextAlign.center,),
                                ),


                              ],)
                        ),
                      ) );
                    }

                    break;

                }

              },
            );
          }
        
      Widget    _drawTopStories() {
return Container(
  color: Colors.grey.shade100,
  child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:16,top: 16),
        child: _drawSectionTitle('Top stories')

      ),
        Padding(padding: EdgeInsets.all(8.0),
        child: Card(
          child: FutureBuilder(
            future: postsAPI.fetchPostsByCategoryId("0"),
            builder: (context,AsyncSnapshot snapShot){
              switch(snapShot.connectionState){
                case ConnectionState.waiting :
                  return _loading();
                  break;
                case ConnectionState.active:
                  return _loading();
                  break;
                case ConnectionState.none :
                  return _connectionError();
                  break;
                case ConnectionState.done :
                  if(snapShot.hasError){

                      return _error(snapShot.error);
                  }else{
                    if(snapShot.hasData){
                      List<Post> posts = snapShot.data;
                      if(posts.length >= 3){
                        Post post= snapShot.data[0];
                        Post post1= snapShot.data[1];
                        Post post2= snapShot.data[2];
                        return Column(

                          children: <Widget>[
                            _drawSingleRow(post),
                            _drawDivider(),
                            _drawSingleRow(post1),
                            _drawDivider(),
                            _drawSingleRow(post2)
                          ],
                        );
                      }else{
                        return _noData();
                      }


                    }else{
                    return _loading();
                    }
                  }
                  break;
                default:
                  return _loading();
                  break;
              }


            },

          )
        ),
        ),

    ]
  ),
);
      }
      Widget _drawRecentUpdates(){
       return Padding(padding: EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: postsAPI.fetchPostsByCategoryId("1"),
          builder:(context,AsyncSnapshot snapShot ){
              switch(snapShot.connectionState){
                case ConnectionState.none :
                  return _connectionError();
                  break;
                case ConnectionState.active:
                  return _loading();
                  break;
                case ConnectionState.waiting:
                  return _loading();
                  break;
                case ConnectionState.done :
                  if(snapShot.hasError){
                          return _error(snapShot.error);
                  }else{
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding :EdgeInsets.only(left: 16 , bottom:8 ,
                              top: 8
                          ) ,
                          child:    _drawSectionTitle('Recent updates'),),
                        _drawRecentUpdatesCard(Colors.cyan,snapShot.data[0]),
                        _drawRecentUpdatesCard(Colors.redAccent, snapShot.data[1]),
                        SizedBox(
                          height: 48,
                        )
                      ],
                    );
                  }
                  break;
                default:
                  return _loading();
                  break;
              }

          }

          ),
        );
      }
      Widget _drawDivider(){
        return Container(
height:1 ,
width: double.infinity,
color: Colors.grey.shade100,
        );
      }
      Widget _drawSingleRow(Post post){
       return InkWell(
         onTap: (){
           Navigator.push(context, MaterialPageRoute( builder:(context){
             return SinglePost(post);
           } ));
         },
         child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: <Widget>[
                        SizedBox(
                          width: 124,
                          height: 124,
                         child: Image.network(post.featuredImage, fit: BoxFit.cover,),
                         ),
                         SizedBox(
                           width: 16,
                         ),
                         Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                             children: <Widget>[
               Text(
                 post.content,
                 maxLines: 3,
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
                            )
                             ],
                           ),
                         )
                      ],
                    ),
                  ),
       );
      }

      _drawSectionTitle(String title){
        return  Text(
          title, 
        style: TextStyle(color: Colors.grey.shade700,
        fontWeight:FontWeight.w600,
        fontSize: 18
        ) ,);
      }
    Widget   _drawRecentUpdatesCard(Color color, Post post){
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute( builder:(context){
            return SinglePost(post);
          } ));
        },
        child: Card(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage(post.featuredImage)
                   )
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.only(top:16.0,left: 16),
              child: Container(
                padding: EdgeInsets.only(left:24,right:24,top:2,bottom:2),
                decoration: BoxDecoration(
                   color: color,
                   borderRadius: BorderRadius.circular(4)
                ),

                child: Text(
                  'Politics',
                 style: TextStyle(color: Colors.white,fontWeight:FontWeight.w500 ) ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:16,right: 16,top: 16,bottom: 8),
            child: Text(post.content,
            style:TextStyle(
              fontSize:18,
              fontWeight: FontWeight.w600
               ),
            ),
            ),
          Padding(
            padding: const EdgeInsets.only(left:16,right: 16, top: 8,bottom: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 18,),
                SizedBox(width:4),
                Text(
                  parseHumanDateTime(post.dateWritten),
                  style:TextStyle(
                    color: Colors.grey,
                    fontSize: 14
                  ) ,)
              ],
            ),
          ),

          ],
          )
        ),
      );

       }
}
 Widget _loading(){
   return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ) ,
  );
}
Widget _connectionError(){
  return Container(
    padding: EdgeInsets.all(16),
    child:Text('connection error ') ,
  );
}
Widget _error(var error){
  return Container(
    padding: EdgeInsets.all(16),
    child:Text(error.toString()) ,
  );
}
Widget _noData(){
  return Container(
    padding: EdgeInsets.all(16),
    child:Text('no data available') ,
  );
}
