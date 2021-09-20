import 'package:flutter/material.dart';
import 'package:test_app/Constants/Pallete.dart';

//Title for every page on Home Tab
class TitleContainer extends StatelessWidget {
  final String title;
  final String subText;
  //Flag to check Profile photo needed
  final bool userProfile;
  TitleContainer({Key key, this.title, this.subText, this.userProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Pallete.secondary,
        //Takes the width of whole screen
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                new Row(
                  children: [
                    //if comes from profile screen then show image
                    if (userProfile == true)
                      new Image.asset("assets/profileImage.jpg"),
                    Text(
                      title ?? '',
                      style: TextStyle(fontSize: 50.0, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(subText ?? '', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10.0)
              ]),
        ));
  }
}
