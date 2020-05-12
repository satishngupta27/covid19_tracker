import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndianStatePage extends StatefulWidget {
  @override
  _IndianStatePageState createState() => _IndianStatePageState();
}

class _IndianStatePageState extends State<IndianStatePage> {
  Map<String, dynamic> IndianStateData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      IndianStateData = json.decode(response.body);
      print(IndianStateData);
      print(IndianStateData['data'].length);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.search),
//              onPressed: () {
//                showSearch(context: context, delegate: Search(countryData));
//              }),
//        ],
        title: Text('Indian States Statatics'),
      ),
      body: IndianStateData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Card(
                    child: Container(
                      height: 100,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 120,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  IndianStateData['data']['regional'][index]
                                      ['loc'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'CONFIRMED:' +
                                      IndianStateData['data']['regional'][index]
                                              ['totalConfirmed']
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Text(
                                  'RECOVERED:' +
                                      IndianStateData['data']['regional'][index]
                                              ['discharged']
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Text(
                                  'DEATHS:' +
                                      IndianStateData['data']['regional'][index]
                                              ['deaths']
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.grey[100]
                                          : Colors.grey[900]),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: IndianStateData == null
                  ? 0
                  : IndianStateData['data']['regional'].length,
            ),
    );
  }
}
