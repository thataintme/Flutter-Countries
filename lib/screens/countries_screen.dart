//import 'dart:convert';
//import 'dart:html';

import 'package:countries/screens/neighbouring-countries.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class CountriesScreen extends StatefulWidget {
  //const HomeScreen({ Key? key }) : super(key: key);
  CountriesScreen(
      this.regions, this.countriesList, this.filteredCountryList, this.region);

  static const route = '/countries-screen';
  List countriesList = [];
  List regions = [];
  List filteredCountryList = [];
  String region = '';

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  //void filterCountryList() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.region}'),
        ),
        body: countriesView(),
      ),
    );
  }

  Widget countriesView() {
    //List regions = ["region 1", "region 2"];
    return ListView.builder(
        itemCount: widget.filteredCountryList.length,
        itemBuilder: (context, index) {
          return getCard(index);
        });
  }

  Widget getCard(int index) {
    var name = widget.filteredCountryList[index]['name'];
    var capital = widget.filteredCountryList[index]['capital'];
    var imgurl = widget.filteredCountryList[index]['flag'];
    var borderCountriesRaw = widget.filteredCountryList[index]['borders'];

    return Card(
      child: ListTile(
        onTap: () {
          List filteredNeighbours = [];
          widget.countriesList.forEach((element) {
            //print('Alpha3Code for $name is ${element['alpha3Code']}');
            if (borderCountriesRaw.contains(element['alpha3Code'])) {
              filteredNeighbours.add(element);
              //print('${element['name']} is present in list $borderCountriesRaw');
            }
          });

          print(borderCountriesRaw);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NeighbouringCountries(
                      widget.countriesList, filteredNeighbours, name)));
        },

        title: Row(
          children: [
            Container(
              height: 60,
              width: 90,
              child: SvgPicture.network(
                imgurl,
                placeholderBuilder: (context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      capital,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        //onTap: () {}, TODOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
      ),
    );
  }
}
