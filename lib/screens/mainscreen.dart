import 'package:countries/screens/exit-popup.dart';
import 'package:flutter/material.dart';
import 'package:countries/screens/main_drawer.dart';
import 'dart:io';

class NeighbourWhood extends StatefulWidget {
  @override
  _NeighbourWhoodState createState() => _NeighbourWhoodState();
}

class _NeighbourWhoodState extends State<NeighbourWhood> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Countries'),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Image(
                  image: AssetImage('images/Banner.png'),
                )),
          ),
          drawer: HomeDrawer(),
        ),
      ),
    );
  }
}
