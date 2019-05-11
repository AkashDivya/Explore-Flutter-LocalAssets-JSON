import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String displayValue;
  final String labelTitle;

  InfoCard({
    @required this.displayValue,
    @required this.labelTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            displayValue,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            labelTitle,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xffacacac),
            ),
          ),
        ],
      ),
    );
  }
}
