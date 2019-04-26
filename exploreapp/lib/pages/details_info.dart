import 'package:flutter/material.dart';

import '../components/list_card.dart';

class DetailsInfo extends StatelessWidget {
  final String description;
  final List<dynamic> storyList;

  DetailsInfo({
    this.description,
    this.storyList,
  });

  @override
  Widget build(BuildContext context) {
    double listHeight1 = MediaQuery.of(context).size.height - 100;
    double listHeight2 = 160;
    double listHeight;

    double topSpace;
    double bottomSpace;

    (listHeight1 > listHeight2)
        ? listHeight = listHeight1
        : listHeight = listHeight2;

    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: listHeight,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: storyList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                topSpace = 30;
                bottomSpace = 20;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      //Description of the venue, fetched from json.
                      description,
                      textAlign: TextAlign.left,
                      maxLines: 7,
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.2,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      //Title of Stories.
                      'LOCAL STORIES',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff7c7c7c),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: topSpace),
                    ListCard(
                        storyImage: storyList[index]['storyImage'],
                        storyTitle: storyList[index]['storyTitle'],
                        storyTime: storyList[index]['storyTime'],
                        storyType: storyList[index]['storyType']),
                    SizedBox(height: bottomSpace),
                    Container(color: Color(0xffeeeeee), height: 1),
                  ],
                );
              }
              if (index == storyList.length - 1) {
                topSpace = 20;
                bottomSpace = 20;
                return Column(
                  children: <Widget>[
                    SizedBox(height: topSpace),
                    ListCard(
                        storyImage: storyList[index]['storyImage'],
                        storyTitle: storyList[index]['storyTitle'],
                        storyTime: storyList[index]['storyTime'],
                        storyType: storyList[index]['storyType']),
                    SizedBox(height: bottomSpace),
                  ],
                );
              } else {
                topSpace = 20;
                bottomSpace = 20;
                return Column(
                  children: <Widget>[
                    SizedBox(height: topSpace),
                    ListCard(
                        storyImage: storyList[index]['storyImage'],
                        storyTitle: storyList[index]['storyTitle'],
                        storyTime: storyList[index]['storyTime'],
                        storyType: storyList[index]['storyType']),
                    SizedBox(height: bottomSpace),
                    Container(color: Color(0xffeeeeee), height: 1),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
