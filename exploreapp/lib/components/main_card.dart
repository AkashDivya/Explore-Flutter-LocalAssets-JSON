import 'package:flutter/material.dart';

import '../pages/detailspage.dart';

class MainCard extends StatelessWidget {
  final String imagePath;
  final String venueName;
  final String venueLocation;

  MainCard({
    this.imagePath,
    this.venueName,
    this.venueLocation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => DetailsPage()),
        );
      },
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width - 60,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withOpacity(0.03),
                      Colors.black.withOpacity(0),
                    ],
                  ),
                  // color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0)
                    ],
                  ),
                  // color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(child: SizedBox()),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  venueName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 2.5,
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  venueLocation + '  .  ' + '4' + ' Stories',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: <Widget>[
                    Text(
                      'EXPLORE',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
            ],
          ),
        ],
      ),
    );
  }
}
