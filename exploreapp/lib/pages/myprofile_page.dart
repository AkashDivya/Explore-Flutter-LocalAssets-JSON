import 'package:flutter/material.dart';

import '../components/info_card.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 30),
      children: <Widget>[
        Container(
          //Page Heading
          alignment: Alignment.centerLeft,
          height: 40,
          child: Text(
            'About Me',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage('assets/images/admin_pic.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'Akash Divya',
          labelTitle: 'Name',
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'akash.apd@gmail.com',
          labelTitle: 'Email',
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: InfoCard(
                displayValue: 'Male',
                labelTitle: 'Gender',
              ),
            ),
            Flexible(
              flex: 1,
              child: InfoCard(
                displayValue: 'April 27, 1992',
                labelTitle: 'D.O.B.',
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'Senior Designer & Flutter Developer',
          labelTitle: 'Expertise',
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
