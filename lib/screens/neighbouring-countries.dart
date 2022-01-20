import 'package:flutter/material.dart';

class NeighbouringCountries extends StatefulWidget {
  //const NeighbouringCountries({ Key? key }) : super(key: key);
  NeighbouringCountries(
      this.countriesList, this.filteredNeighboursList, this.selectedCountry);

  List countriesList = [];
  List filteredNeighboursList = [];
  String selectedCountry = '';

  @override
  _NeighbouringCountriesState createState() => _NeighbouringCountriesState();
}

class _NeighbouringCountriesState extends State<NeighbouringCountries> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Neighbours of ${widget.selectedCountry}'),
        ),
        body: neighboursView(),
      ),
    );
  }

  Widget neighboursView() {
    if (widget.filteredNeighboursList.length == 0) {
      return Card(
        child: Center(
          child: Text(
            '${widget.selectedCountry} has no neighbours',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
      );
    }

    return ListView.builder(
        itemCount: widget.filteredNeighboursList.length,
        itemBuilder: (context, index) {
          return getCard(index);
        });
  }

  Widget getCard(int index) {
    var name = widget.filteredNeighboursList[index]['name'];
    var languagesSpokenRaw = widget.filteredNeighboursList[index]['languages'];

    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 80),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
                child: Divider(
                  height: 10,
                ),
              ),
              Container(
                  width: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: languagesSpokenRaw.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Container(
                            //padding: EdgeInsets.all(6),
                            child: Text(languagesSpokenRaw[index]['name']),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
