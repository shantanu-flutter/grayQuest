import 'package:flutter/material.dart';
import 'package:test_app/CommonWidget/TitleContainer.dart';
import 'package:test_app/Constants/Pallete.dart';

class ToDoView extends StatefulWidget {
  @override
  _ToDoViewState createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  void initState() {
    print("Setting TODO int");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleContainer(
                    title: "To DO", subText: "Random Text about To DO"),
                SizedBox(
                  height: 200,
                ),
              ]),
        ),
      ),
    );
  }
}
