import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './countries_screen.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({ Key? key }) : sup//er(key: key);
  static const route = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regions'),
      ),
      body: RegionsView(),
    );
  }
}

class RegionsView extends StatefulWidget {
  //const RegionsView({ Key? key }) : super(key: key);

  @override
  _RegionsViewState createState() => _RegionsViewState();
}

class _RegionsViewState extends State<RegionsView> {
  List countriesList = [];
  List regions = [];
  //List<SvgPicture> flagsSVGpics = [];
  @override
  void initState() {
    super.initState();
    this.fetchCountries();
  }

  fetchCountries() async {
    var apiURL = 'https://restcountries.eu/rest/v2/all';
    var apiResponse = await http.get(apiURL);
    if (apiResponse.statusCode == 200) {
      var items = json.decode(apiResponse.body);

      var regionss = items
          .map((country) {
            return country['region'];
          })
          .toSet()
          .toList();

      setState(() {
        countriesList = items;
        regions = regionss;
      });
    } else {
      countriesList = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (regions.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
        child: ListView.builder(
            itemCount: regions.length,
            itemBuilder: (context, index) {
              return getCard(index);
            }));
  }

  Widget getCard(int index) {
    var region = regions[index];

    return GestureDetector(
      onTap: () {
        List filteredCountryList = [];
        countriesList.forEach((element) {
          if (element['region'] == region) {
            filteredCountryList.add(element);
          }
        });

//        print(filteredCountryList);
//        print(filteredCountryList.length);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CountriesScreen(
                    regions, countriesList, filteredCountryList, region)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Text(
            region == '' ? 'Unlisted' : region,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
