import 'package:flutter/material.dart';

import '../pages/detailspage.dart';

class MainCard extends StatelessWidget {
  final String imagePath;
  final String venueName;
  final String venueLocation;
  final int numberStories;

  MainCard({
    this.imagePath,
    this.venueName,
    this.venueLocation,
    this.numberStories,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailsPage(
                  imagePath: imagePath,
                  venueName: venueName,
                  venueLocation: venueLocation,
                  numberStories: numberStories,
                ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Hero(
          tag: venueName,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.2),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
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
