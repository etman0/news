import 'package:flutter/material.dart';
import 'package:news/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orange
  );
  List<int> ids = [0,2,7];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('instegram feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(

        padding: EdgeInsets.all(8),
        itemBuilder: (context,position){
        return Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Card(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    _drawHeader( position ),
                    _drawTitle(),
                    _drawHashtags(),
                    _drawBody(),
                    _drawFooter()

                        ],
            ) ,
            ),
        );
      },
      itemCount:20 ,
      ),
    );
  }
 Widget _drawHeader(int position){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
  Row(
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
    Text('lisa englemann',
    style: TextStyle(color: Colors.grey[900],
    fontSize: 16,
    fontWeight: FontWeight.w600
    )),
    SizedBox(
      width:8
    ),
    SizedBox(height: 8,),
    Text('fri, 12 may 2017 : 14.30 ',style: TextStyle(color: Colors.grey[900]))
  ],
)
],
  ),
  
              Row(
             children: <Widget>[
               IconButton(icon: Icon(Icons.favorite), 
               color:(ids.contains(position) ) ? Colors.red : Colors.grey.shade400,
            
               onPressed: (){
                 if(ids.contains(position)){
                    ids.remove(position);
                 }else{
                   ids.add(position);
                 }
                 setState(() {

                 });
               }),
                  Transform.translate(
                    offset:Offset(-12,0 ) ,
                    child: Text('25', 
                    style: TextStyle(color: Colors.red, fontSize: 16),)),
             ],
                  )
],
);
  }
  Widget _drawTitle(){
return Padding(
  padding: const EdgeInsets.only(bottom:8.0, left:16 , right: 16),
  child:   Text('ccyrrdt uyrdurd ri ird irdir',
   style: TextStyle(color: Colors.grey.shade900), ),
  
  
  
 
);
  }
  Widget _drawHashtags(){
return Container(
  child: Wrap(
   
    children: <Widget>[
      FlatButton(onPressed: (){}, 
      child: Text('#trump', style: _hashTagStyle,)),
      FlatButton(onPressed: (){}, 
      child: Text('#trump', style: _hashTagStyle,)),
      FlatButton(onPressed: (){}, 
      child: Text('#trump', style: _hashTagStyle,)),
    ],
  ),
);
  }
  Widget _drawBody(){
return SizedBox(
  width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.25,
    child: Image(
      image: ExactAssetImage('assets/images/m4.jpg'),
      fit: BoxFit.cover,)
);
  }
  Widget _drawFooter(){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    FlatButton(onPressed: (){},
        child: Text('10 comments',style: _hashTagStyle,)
    ),
    Row(
      children: <Widget>[
        FlatButton(onPressed: (){},
            child: Text('share',style: _hashTagStyle,)
        ),

        FlatButton(onPressed: (){},
            child: Text('open',style: _hashTagStyle, )
        ),
      ],
    ),


  ],
);
  }
}