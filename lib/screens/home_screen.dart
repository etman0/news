

import 'package:flutter/material.dart';
import 'package:news/screens/home_tabs/favourites.dart';
import 'package:news/shared_ui/navigation_drawer.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';
import 'package:news/api/authors_api.dart';
import 'package:news/api/categories_api.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/help.dart';
import 'pages/setting.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu{
  help,about, contact , settings
}
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync:this );
  }
  @override
void dispose(){
_tabController.dispose();
super.dispose();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
    title: Text('Explore') ,
    centerTitle: false,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: (){}),
       _popOutMenu(context)
    ],
    bottom: TabBar(
      indicatorColor: Colors.white,
      tabs: [
      Tab(text: "what's new ?"),
       Tab(text: "popular"),
        Tab(text: "favourites"),
    ],
    controller: _tabController ,
    ) ,
      ) ,
      drawer: NavigationDrawer() ,
      body: Center(
        child:TabBarView(
          controller: _tabController,
         children: [
           WhatsNew(),
      Popular(),
            Favourites(),
        ],)
      ),
    );
  }
  Widget _popOutMenu(BuildContext context){
  return PopupMenuButton<PopOutMenu>(itemBuilder: (context){

    return [
      PopupMenuItem < PopOutMenu >(
      value:PopOutMenu.about,
        child: Text('about')
      ),
      PopupMenuItem < PopOutMenu >(
          value:PopOutMenu.contact,
          child: Text('contact')
      ),
      PopupMenuItem < PopOutMenu >(
          value:PopOutMenu.help,
          child: Text('help')
      ),
      PopupMenuItem < PopOutMenu >(
          value:PopOutMenu.settings,
          child: Text('settings')
      ),
    ];
  }, onSelected:(PopOutMenu menu ){
      switch(menu){
        case PopOutMenu.about:
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return AboutUs();
          }));
         break;
        case PopOutMenu.settings:
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return Settings();
          }));
          break;
          case PopOutMenu.contact:
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return ContactUs();
            }));
          break;
          case PopOutMenu.help:
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return Help();
            }));
          break;
      }
  } ,
    icon: Icon(Icons.more_vert),
  );
  }
}