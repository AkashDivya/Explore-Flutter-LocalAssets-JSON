import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/zion_national_park_usa.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 60,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'venueName',
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
                  'venueLocation' + '  .  ' + '4' + ' Stories',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
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
