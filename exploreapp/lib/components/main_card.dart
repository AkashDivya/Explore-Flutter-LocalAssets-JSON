import 'package:flutter/material.dart';

import '../pages/details_page.dart';

class MainCard extends StatelessWidget {

  //Variables for datas recieved from json.
  final String imagePath;
  final String venueName;
  final String venueLocation;
  final int numberStories;
  final String description;
  final List<dynamic> storyList;

  //Importing datas from json via explore_page.dart
  MainCard({
    this.imagePath,
    this.venueName,
    this.venueLocation,
    this.numberStories,
    this.description,
    this.storyList,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        //Creates Details Page for respective Data.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailsPage(
                  imagePath: imagePath,
                  venueName: venueName,
                  venueLocation: venueLocation,
                  numberStories: numberStories,
                  description: description,
                  storyList: storyList,
                ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Hero(
          //Hero Animation
          tag: venueName + 'MainCard',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: <Widget>[
                Container(
                  //Image on Card BG (from json).
                  width: MediaQuery.of(context).size.width - 60,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.2),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                Container(
                  //Texts on Card.
                  width: MediaQuery.of(context).size.width - 60,
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        //Venue Name
                        color: Colors.transparent,
                        child: Text(
                          venueName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Material(
                        //Venue Location + some other details.
                        color: Colors.transparent,
                        child: Text(
                         venueLocation + '  .  ' + numberStories.toString() + ' Stories',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Material(
                        //Explore Button
                        color: Colors.transparent,
                        child: Text(
                          'EXPLORE',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
