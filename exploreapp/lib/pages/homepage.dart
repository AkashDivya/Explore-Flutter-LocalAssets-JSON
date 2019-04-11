import 'package:flutter/material.dart';

import '../pages/explore_page.dart';
import '../pages/maps_page.dart';
import '../pages/myprofile_page.dart';

class HomePage extends StatelessWidget {

  //Thiscustom Function will show Modal BottomSheet
  void _showSettingsBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Text('Settings will show up here.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    //The whole Code is wrapped in DefaultTabController to make it Controlled via Tabs
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              //Settings Icon - Opens Modal BottomSheet
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.centerRight,
              height: 30,
              child: IconButton(
                icon: Icon(
                  IconData(0xe803, fontFamily: 'TabIcons'),
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  _showSettingsBottomSheet(context);
                },
              ),
            ),
            Expanded(
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
