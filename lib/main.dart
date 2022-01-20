import 'package:countries/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:countries/screens/mainscreen.dart';
import 'package:countries/screens/countries_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contries',
      color: Colors.blueAccent,
      //home: NeighbourWhood(),
      routes: {
        '/': (_) => NeighbourWhood(),
        //CountriesScreen.route: (_) => CountriesScreen(),
        HomeScreen.route: (_) => HomeScreen(),
      },
    );
  }
}
