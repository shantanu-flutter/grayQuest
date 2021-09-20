import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/CommonWidget/TitleContainer.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Provider/UserProvider.dart';
import 'package:test_app/Screens/Profile/widget/InfoLabel.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    print("Setting int");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
                    title: "User Profile",
                    subText: "Random Text about user",
                    userProfile: true),
                SizedBox(
                  height: 10,
                ),
                label("Basic Details"),
                InfoLabel(
                  title: "Name",
                  details: userProvider.user?.name ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
                InfoLabel(
                  title: "Email Address",
                  details: userProvider.user?.email ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
                InfoLabel(
                  title: "Password",
                  details: userProvider.user?.password ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
                InfoLabel(
                  title: "Company",
                  details: userProvider.user?.company ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                InfoLabel(
                  title: "Website",
                  details: userProvider.user?.website ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
        ),
      ),
    );
  }

  Widget label(String category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        category,
        style: TextStyle(color: Pallete.secondary),
      ),
    );
  }
}
