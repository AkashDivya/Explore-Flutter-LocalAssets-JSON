import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String storyImage;
  final String storyTitle;
  final String storyTime;
  final String storyType;

  ListCard({
    this.storyImage,
    this.storyTitle,
    this.storyTime,
    this.storyType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              storyImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          children: <Widget>[
            Container(
              //This container prevents Parent Row from expandeing beyond width.
              width: MediaQuery.of(context).size.width - 160,
              child: Text(
                storyTitle,
                maxLines: 1,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 5),
            Container(
              //This container prevents Parent Row from expandeing beyond width.
              width: MediaQuery.of(context).size.width - 160,
              child: Text(
                storyTime + '  .  ' + storyType,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xffacacac),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
