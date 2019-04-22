import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  void _showSettingsBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Text('Settings will show up here.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 5),
      alignment: Alignment.centerRight,
      height: 75,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          IconData(0xe803, fontFamily: 'TabIcons'),
          color: Colors.black,
          size: 20,
        ),
        onPressed: () {
          _showSettingsBottomSheet(context);
        },
      ),
    );
  }
}
