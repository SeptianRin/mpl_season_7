import 'package:flutter/material.dart';
import 'package:mpl_season_7/ui/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MPL Season 7',
      theme: ThemeData(
        primaryColor: Colors.red[900],
      ),
      home: SplashScreen(),
    );
  }
}