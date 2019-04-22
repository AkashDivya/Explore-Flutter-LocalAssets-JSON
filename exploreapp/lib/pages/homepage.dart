import 'package:flutter/material.dart';

import '../pages/explore_page.dart';
import '../pages/maps_page.dart';
import '../pages/myprofile_page.dart';
import '../components/custom_appbar.dart';

class HomePage extends StatelessWidget {
  //Thiscustom Function will show Modal BottomSheet

  @override
  Widget build(BuildContext context) {
    //The whole Code is wrapped in DefaultTabController to make it Controlled via Tabs
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: CustomAppBar(),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          //ListView here makes sure that keyboard doesn't hide any content in any Screen Orientation.
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 165,
              child: TabBarView(
                //TabBarView defines the area of TabPages
                children: <Widget>[
                  ExplorePage(),
                  MapsPage(),
                  MyProfilePage(),
                ],
              ),
            )
          ],
        ),

        //Bottom Tabs
        bottomNavigationBar: TabBar(
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).accentColor,
          indicatorColor: Colors.yellowAccent.withOpacity(0.0),
          labelPadding: EdgeInsets.all(20),
          tabs: <Widget>[
            Tab(
              // Explore Tab
              icon: Icon(IconData(0xe800, fontFamily: 'TabIcons')),
            ),
            Tab(
              // Maps Tab
              icon: Icon(IconData(0xe801, fontFamily: 'TabIcons')),
            ),
            Tab(
              // Profile Tab
              icon: Icon(IconData(0xe802, fontFamily: 'TabIcons')),
            ),
          ],
        ),
      ),
    );
  }
}
