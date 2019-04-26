import 'package:flutter/material.dart';
import 'dart:convert'; //Used to convert json data into useful one.

import '../components/searchbar.dart';
import '../components/main_card.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage> {
  //variables for conditional spaces between MainCards.
  double leftSideSpace;
  double rightSideSpace;

  @override
  Widget build(BuildContext context) {
    //Conditional Height for better view in any Screen orientation.
    double cardHeight1 = MediaQuery.of(context).size.height - 300;
    double cardHeight2 = 290;
    double cardHeight;

    (cardHeight1 > cardHeight2)
        ? cardHeight = cardHeight1
        : cardHeight = cardHeight2;

    return ListView(
      //Contains the whole Page. Its a ListView but given height to
      //fix it on the Screen.
      padding: EdgeInsets.only(
          top: 0), //Remove default padding provided by ListView.

      children: <Widget>[
        Container(
          //Page Heading
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 40,
          child: Text(
            'Explore',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          //SearchBar
          child: SearchBar(),
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(height: 20),
        Container(
          //Converts json data into Usable data.
          height: cardHeight,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/explore_locations.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var explorejson = jsonDecode(snapshot.data.toString());
              

              //Main Horizontal ListView.Builder with MainCards
              return ListView.builder(
                scrollDirection: Axis.horizontal,

                //Conditions for assigning spaces between MainCards according to its index.
                itemCount: (explorejson != null) ? (explorejson.length) : 0,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    leftSideSpace = 30;
                    rightSideSpace = 0;
                  } else if (index < explorejson.length - 1) {
                    leftSideSpace = 10;
                    rightSideSpace = 0;
                  } else {
                    leftSideSpace = 10;
                    rightSideSpace = 30;
                  }
                  return Row(
                    children: <Widget>[
                      SizedBox(width: leftSideSpace),
                      MainCard(
                        imagePath: explorejson[index]['imagePath'],
                        venueName: explorejson[index]['venueName'],
                        venueLocation: explorejson[index]['venueLocation'],
                        numberStories: explorejson[index]['stories'].length,
                        description: explorejson[index]['description'],
                        storyList: explorejson[index]['stories'],
                      ),
                      SizedBox(width: rightSideSpace),
                    ],
                  );
                  
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
