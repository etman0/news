import 'package:flutter/material.dart';
import 'package:news/shared_ui/navigation_drawer.dart';
class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(

        padding: EdgeInsets.all(8),
        itemBuilder: (context,postion){
        return Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Card(
            
            child: Column(
                children: <Widget>[
                      _cardHeader(),
                      _cardBody(),
                      _drawLine(),
                      _cardFooter()

                        ],
            ) ,
            ),
        );
      },
      itemCount:20 ,
      ),
    );
  }
  Widget _cardHeader(){

return Row(
children: <Widget>[
  Padding(
    padding: const EdgeInsets.all(16.0),
    child: CircleAvatar(
      backgroundImage: ExactAssetImage('assets/images/m5.jpg'),
      radius:24 ,

    ),
  ),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Row(
      children: <Widget>[
        Text('lisa englemann',
        style: TextStyle(color: Colors.grey[900],
        fontSize: 16,
        fontWeight: FontWeight.w600
        )),
        SizedBox(
          width:8
        ),
         Text('@lisaenglemann',
         style: TextStyle(color: Colors.grey[900]),),
      ],
    ),
    SizedBox(height: 8,),
    Text('fri, 12 may 2017 : 14.30 ',style: TextStyle(color: Colors.grey[900]))
  ],
)

],
);
  }
  Widget _cardBody(){

return Padding(
  padding: const EdgeInsets.only(left:16.0, right:16,bottom: 8 ),
  child:   
  Text('hvjh bhvvvhjv  gchtcchc vkjgvjv yfhchxc hgcmcxgndx m tcjcytc '
  ,style: TextStyle(fontSize:16, height: 1.2 )
  
  ),
);
  }
  Widget _cardFooter(){
return Padding(
  padding: const EdgeInsets.all(8),
  child:   Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
  
    Row(
      children: <Widget>[
        IconButton(icon: Icon(Icons.repeat, size: 28,),
        color: Colors.orange, onPressed: (){}),
      Text('65 mins', style: TextStyle(color: Colors.blue[700],fontSize:16 )) 
      ],
    ),
 Row(
children: <Widget>[
  FlatButton(onPressed:(){}, child: Text('share',
   style: TextStyle(color: Colors.orange) ,)),
  FlatButton(onPressed:(){}, child: Text('open',style: TextStyle(color: Colors.orange))),

],
        )
      ],
  
  ),
);
  }
 Widget _drawLine(){
      return Container(
       height: 1,
       color: Colors.grey.shade200,
       margin: EdgeInsets.only(top:16),
      );
  }
}