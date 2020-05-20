import 'package:flutter/material.dart';
import 'package:news/pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:news/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;
  int _currentIndex = 0;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  void _addpages(){
    pages = List<PageModel>() ;
 pages.add(
      PageModel(
        'welcome !',
         'follow world news',
         Icons.access_alarm,
         'assets/images/m1.jpg', ), );
          pages.add(
      PageModel(
        'loading !',
         'stay updated',
         Icons.access_time,
         'assets/images/m3.jpg', ), );
          pages.add(
      PageModel(
        'Downloading content',
         'explore the world',
         Icons.access_alarms,
         'assets/images/m4.jpg', ), );
          pages.add(
      PageModel(
        'updating newsfeed',
         'know more',
         Icons.timer,
         'assets/images/m5.jpg', ), );
  }
  @override
  Widget build(BuildContext context) {
   _addpages();
  
    return  Stack(
      children: <Widget>[
        Scaffold(
                body: PageView.builder(
            itemBuilder: ( context, index){
              return Stack(
                children: <Widget>[
                  Container(
              
                    decoration: BoxDecoration(
                         image: DecorationImage(
                           image: ExactAssetImage( pages [ index ].image ),
                                fit:BoxFit.cover 
  ),
              ),
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              Transform.translate(
offset: Offset(0, -70.0),
                child: Icon(
               pages [ index ].icon,
                size: 150.0,
                color: Colors.yellowAccent.shade200, 
                )
                ),
           Text(pages [ index ].title ,
            textAlign: TextAlign.center,
           style: TextStyle(color: Colors.yellowAccent.shade200,
           fontSize: 28.0,
           fontWeight: FontWeight.bold
           ),
           ),
             
              Padding(
                padding: const EdgeInsets.only(left:120.0,right:140.0,top:18.0 ),
                child: Text(pages [ index ].desc,
           style: TextStyle(color: Colors.yellowAccent[200],
           fontSize: 16.0
           ), 
           textAlign: TextAlign.center,
           ),
              ),
      ]
    )
  ],
);
            },

            itemCount: pages.length,
            onPageChanged: (index){
              _pageViewNotifier.value = index;
            } ,
            
            ),
        ),
        Transform.translate(
          offset: Offset(0, 175),
                  child: Align(
alignment: Alignment.center,
child:_displayPageIndicator(pages.length)/*
Container()
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
 children: _drawPageIndicator()
  
   
  
  
),*/

          ),
        ),
               Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
            padding: const EdgeInsets.only(bottom:24.0,left:16,right:16  ),
              child:  SizedBox(
              width: double.infinity,
              height: 50,
               child: RaisedButton(
              color: Colors.red.shade800 ,
              child: Text('GET STARTED',
              style:TextStyle(
                color: Colors.white,
                fontSize: 16, 
                letterSpacing:1 
                ) ,
                ) ,
                   onPressed: (){
                     Navigator.push(
                       context,
                      MaterialPageRoute(
                      
                   builder:  (cotext) {
                     // TODO :update seen
                     _updateSeen();
                        return HomeScreen();
                      }) );
                   },
                
                ),
            ),
               ),
          )

      ],
      );
   
  }
Widget _displayPageIndicator(int length ){
  return PageViewIndicator(
  pageIndexNotifier: _pageViewNotifier,
  length: length,
  normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
  highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
);
}

 void _updateSeen() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('seen', true);
    }
List<Widget> _drawPageIndicator(){
  List<Widget> _widgets = List<Widget>();
  for(var i = 0 ; i < pages.length; i++ ){
    _widgets.add(
_drawCircle(Colors.red)
    );
  }
  return _widgets;
}
Widget _drawCircle(Color color){
      
 return    Container(
     width: 15,
    margin: EdgeInsets.only(right:8),
     decoration: BoxDecoration(
      color: color ,  
      shape: BoxShape.circle
     )
   );  
}
    }
/*
class PageIndicator{
  Widget _widget;
  Color color;
  PageIndicator(this._widget,this.color);
}*/



