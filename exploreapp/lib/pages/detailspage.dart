import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String venueName;
  final String venueLocation;
  final int numberStories;

  DetailsPage({
    this.imagePath,
    this.venueName,
    this.venueLocation,
    this.numberStories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Hero(
              tag: venueName + 'MainHero',
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0)
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox(),),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                //This Close Icon
                height: 30,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 30,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  venueLocation +
                      '  .  ' +
                      numberStories.toString() +
                      ' Stories',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.centerRight,
                child: Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_downward,
                    ),
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
