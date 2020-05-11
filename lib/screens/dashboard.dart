import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icovid19tracker/customwidget/globaldata.dart';
import 'package:icovid19tracker/customwidget/globallist.dart';
import 'package:icovid19tracker/customwidget/mostaffected.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage('Images/map.png'), fit: BoxFit.fill)),
            height: 150,
            //child: Image.asset('Images/map.png',fit: BoxFit.fill,),
          ),
        ),
      ),
      GlobalDdata(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                child: Text(
                  'Most affected Countries',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              countryData == null
                  ? Container()
                  : MostAffectedPanel(
                      countryData: countryData,
                    ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CountryPage()));
        },
        child: Card(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.redAccent),
            child: Center(
                child: Text(
              'Country Wise statatics',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    ]);
  }
}
