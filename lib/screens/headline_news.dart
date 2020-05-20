import 'package:flutter/material.dart';
import 'package:news/shared_ui/navigation_drawer.dart';

import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';
class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin  {
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
    return  Scaffold(
      appBar: AppBar(
    title: Text('Headline news') ,
    centerTitle: false,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: (){}),
       IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
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
            Favourites(),
      Popular(),
            Favourites(),
        ],)
      ),
    );
  }
}