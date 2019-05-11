import 'package:flutter/material.dart';

import './color_Radio.dart';

class CustomAppBar extends StatefulWidget {
  final bloc;

  CustomAppBar(this.bloc);

  //Thiscustom Function will show Modal BottomSheet
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<RadioList> radioList = [
    RadioList(true, 'yellow', Color(0xffEAC21E)),
    RadioList(false, 'red', Color(0xffff3f20)),
    RadioList(false, 'blue', Color(0xff00aeff)),
    RadioList(false, 'green', Color(0xff00d000)),
    RadioList(false, 'pink', Color(0xffff00a8)),
  ];

  void _showSettingsBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StreamBuilder(
            stream: widget.bloc.recieveStatus,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              widget.bloc.feedStatus('false');
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(
                      'Choose an\n' 'Accent Color',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: radioList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              InkWell(
                                child: ColorRadio(
                                  radioList[index].isActive,
                                  radioList[index].colorName,
                                  radioList[index].radioColor,
                                ),
                                onTap: () {
                                  if (radioList[index].isActive) {
                                    return null;
                                  } else {
                                    return setState(() {
                                      radioList.forEach((element) =>
                                          element.isActive = false);
                                      widget.bloc.feedStatus('false');
                                      print(snapshot);
                                      radioList[index].isActive =
                                          (snapshot.data == 'true')
                                              ? true
                                              : false;
                                      widget.bloc.sinkColorName(
                                          radioList[index].colorName);
                                    });
                                  }
                                },
                              ),
                              SizedBox(
                                  width: (index == radioList.length - 1)
                                      ? 0
                                      : ((MediaQuery.of(context).size.width -
                                              (70 + (50 * radioList.length))) /
                                          (radioList.length - 1))),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        fillColor: Colors.black,
                        constraints:
                            BoxConstraints(minHeight: 40, minWidth: 200),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        textStyle: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        child: Text('DONE'),
                      ),
                    ),
                  ],
                ),
              );
            });
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

class RadioList {
  bool isActive;
  final String colorName;
  final Color radioColor;

  RadioList(
    this.isActive,
    this.colorName,
    this.radioColor,
  );
}
