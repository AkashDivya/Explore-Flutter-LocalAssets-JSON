import 'package:flutter/material.dart';
import 'dart:convert'; //This will Convert json data into usable List

import '../components/searchbar.dart';
import '../components/main_card.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage> {
  //The following doubles will be customized according to json index
  double leftSideSpace;
  double rightSideSpace;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[
        Container(
          //Page Heading
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.centerLeft,
          child: Text(
            'Explore',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: 2.5,
          ),
        ),
        SizedBox(height: 20),
        Container(
          //SearchBar
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SearchBar(),
        ),
        SizedBox(height: 25),
        Container(
          //This container have ListView.builder wich creates List of MainCards via json Data
          height: MediaQuery.of(context).size.height - 325,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/explore_locations.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var explorejson = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (explorejson != null) ? (explorejson.length) : 0,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    print(index);
                    leftSideSpace = 30;
                    rightSideSpace = 0;
                  } else if (index < explorejson.length - 1) {
                    print(index);
                    leftSideSpace = 10;
                    rightSideSpace = 0;
                  } else {
                    print(index);
                    leftSideSpace = 10;
                    rightSideSpace = 30;
                  }
                  print('card');
                  return Row(
                    children: <Widget>[
                      SizedBox(width: leftSideSpace),
                      MainCard(
                        //MainCard is imported from main_card.dart
                        imagePath: explorejson[index]['imagePath'],
                        venueName: explorejson[index]['venueName'],
                        venueLocation: explorejson[index]['venueLocation'],
                        numberStories: explorejson[index]['numberStories'],
                      ),
                      SizedBox(width: rightSideSpace),
                    ],
                  );
                },
              );
            },
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
