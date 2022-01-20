import 'package:countries/screens/countries_screen.dart';
import 'package:countries/screens/exit-popup.dart';
import 'package:countries/screens/home-screen.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: AppBar().preferredSize.height * 1.5,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Align(
                child: Text(
                  'Navigate',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.route);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () {
              showExitPopup(context);
            },

            // ADD EXIT APP CODE HERE
          ),
        ],
      ),
    );
  }
}
