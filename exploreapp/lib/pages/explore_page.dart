import 'package:flutter/material.dart';
import 'dart:convert';

import '../components/searchbar.dart';
import '../components/main_card.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage> {
  double leftSideSpace;
  double rightSideSpace;

  @override
  Widget build(BuildContext context) {
    double cardHeight1 = MediaQuery.of(context).size.height - 300;
    double cardHeight2 = 290;
    double cardHeight;

    (cardHeight1 > cardHeight2)
        ? cardHeight = cardHeight1
        : cardHeight = cardHeight2;

    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[
        Container(
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
          child: SearchBar(),
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(height: 20),
        Container(
          height: cardHeight,
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
                  return Row(
                    children: <Widget>[
                      SizedBox(width: leftSideSpace),
                      MainCard(
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
      ],
    );
  }
}
