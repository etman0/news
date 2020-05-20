import 'package:flutter/material.dart';
import 'package:news/models/nav_menu.dart';
import 'package:news/screens/facebook_feeds.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/headline_news.dart';
import 'package:news/screens/twitter_feed.dart';
import 'package:news/screens/instagram_feed.dart';
import 'package:news/utilities/app_utilities.dart';
import 'dart:async';
import 'package:news/screens/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
 static bool isLoggedIn = false;
 String token;
 SharedPreferences sharedPreferences;
 List<NavMenuItem> navigationMenu = [
    NavMenuItem("EXPLORE", () {return HomeScreen();} ),
    NavMenuItem("headline news",() => HeadLineNews()),
    NavMenuItem("twitter feeds ", ()=>TwitterFeed()),
    NavMenuItem("instegram feeds",()=> InstagramFeed() ),
    NavMenuItem("facebook feeds",()=> FacebookFeeds() ),
  //  NavMenuItem("log in ", ()=> Login()),


  ];
  _checkToken()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get('token');
   setState(() {
     if(token ==null){
       isLoggedIn =false;
     }else{
       isLoggedIn = true;
     }
   });

  }
  _logout(){
    if(sharedPreferences != null){
      sharedPreferences.remove('token');
    }

     return Login();
  }
@override
  void initState()  {
    // TODO: implement initState
    super.initState();
    if(isLoggedIn){
      navigationMenu.add(NavMenuItem("log out", ()=> _logout()),);
    }

  }

  List<String> navMenu =[
    'explore',
    'headline news',
    'read later',
    'videos',
    'photos',
    'settings',
    'logout'
  ];
  @override
  Widget build(BuildContext context) {
    if (this.mounted) {
      _checkToken();
    }
    return Drawer(
      child:Padding(
        padding: EdgeInsets.only(top:70, left:24),
              child: ListView.builder(
          itemBuilder: (context, position){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: ListTile(
                     title: Text(
                      navigationMenu[position].title, style: TextStyle(
                       color:Colors.black,
                       fontSize: 22
                     ),),
                     trailing: Icon(Icons.chevron_right, 
                     color: Colors.black ,),
                     onTap: (){
                       Navigator.pop(context);
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context){
                        return navigationMenu[position].destination();
                       }));
                     },
                 ),
             );
          },
          itemCount:navigationMenu.length ,
        
        ),
      )
    );
  }
}