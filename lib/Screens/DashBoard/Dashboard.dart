import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Globals.dart';
import 'package:test_app/Provider/PostProvider.dart';
import 'package:test_app/Screens/Album/AlbumView.dart';
import 'package:test_app/Screens/Post/PostView.dart';
import 'package:test_app/Screens/Profile/ProfileView.dart';
import 'package:test_app/Screens/ToDO/ToDoView.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Widget> _listScreens;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _listScreens = [
      PostView(),
      AlbumView(),
      ToDoView(),
      ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var articlesProvider = Provider.of<PostProvider>(
      context,
      listen: false,
    );
    return WillPopScope(
      onWillPop: () async {
        Utitlies.logoutApp(context);
        //articlesProvider.clearList();
        return true;
      },
      child: new Scaffold(
        body: IndexedStack(index: _tabIndex, children: _listScreens),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _tabIndex,
            onTap: (int index) {
              setState(() {
                _tabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/vector1.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/vector2.svg'),
                label: 'Albums',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/vector3.svg'),
                label: 'TO DO',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/vector4.svg'),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
