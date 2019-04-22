import 'package:flutter/material.dart';

class DetailsCover extends StatelessWidget {
  //Variables to recieve datas from MainCard (as per index)
  final String imagePath;
  final String venueName;
  final String venueLocation;
  final int numberStories;

  //Recieving Datas
  DetailsCover({
    this.imagePath,
    this.venueName,
    this.venueLocation,
    this.numberStories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Hero(
        //Hero Animation
        tag: venueName + 'MainCard',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            children: <Widget>[
              Container(
                //Image on Card BG (from json).
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.2),
                  colorBlendMode: BlendMode.multiply,
                ),
              ),
              Container(
                //Texts on Card.
                width: MediaQuery.of(context).size.width,
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
                        venueLocation +
                            '  .  ' +
                            numberStories.toString() +
                            ' Stories',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: (MediaQuery.of(context).size.height / 3)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
