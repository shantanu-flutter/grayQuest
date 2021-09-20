import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Constants/constants.dart';
import 'package:test_app/Database/AppDatabase.dart';
import 'package:test_app/Provider/AlbumProvider.dart';
import 'package:test_app/Provider/PostProvider.dart';
import 'package:test_app/Provider/AlbumPhotosProvider.dart';
import 'package:test_app/Provider/UserProvider.dart';
import 'package:test_app/Screens/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase.get().generateDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userProvider = ChangeNotifierProvider.value(
      value: UserProvider(),
    );

    final postProvider = ChangeNotifierProvider.value(
      value: PostProvider(),
    );

    final albumProvider = ChangeNotifierProvider.value(
      value: AlbumProvider(),
    );

    final albumPhotosProvider = ChangeNotifierProvider.value(
      value: AlbumPhotosProvider(),
    );

    return MultiProvider(
      //Register all the providers at start
      providers: [
        userProvider,
        postProvider,
        albumProvider,
        albumPhotosProvider
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(//Theme across all the application if not overridden
          primaryColor: Colors.black,
          backgroundColor: Pallete.primary,
          primaryColorDark: Pallete.primary,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Pallete.primary,
              selectedIconTheme: IconThemeData(color: Colors.white),
              unselectedIconTheme: IconThemeData(color: Pallete.secondary),
              selectedItemColor: Colors.white,
              unselectedItemColor: Pallete.secondary),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Pallete.primaryButtonColor,
          ),
          inputDecorationTheme: inputTheme,
        ),
        home: Splash(),//Splash screen for few Seconds then login screen
      ),
    );
  }
}
