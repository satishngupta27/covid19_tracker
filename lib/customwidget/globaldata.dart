import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icovid19tracker/model/tcases.dart';

class GlobalDdata extends StatefulWidget {
  @override
  _GlobalDdataState createState() => _GlobalDdataState();
}

class _GlobalDdataState extends State<GlobalDdata> {
  final String url = "https://corona.lmao.ninja/v2/all";

  @override
  void initState() {
    super.initState();

    this.getJsonData();
  }

  Future<TCases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);

      return TCases.fromJson(convertDataJson);
    } else {
      throw Exception('Try to  Reload Page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TCases>(
        future: getJsonData(),
        builder: (BuildContext context, SnapShot) {
          if (SnapShot.hasData) {
            final covid = SnapShot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'Images/globe.png',
                              height: 30,
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Text(
                                "CoronaVirus Global",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 8, 8, 0),
                        child: Text(
                            'Affected Countries: ${covid.affectedCountries}'),
                      ),
                      SizedBox(
                        height: 370,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 16, 2, 8),
                                    child: Text(
                                      '${covid.cases}',
                                      style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 16, 2, 4),
                                    child: Text('New: +${covid.todayCases}'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Deaths',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 16, 2, 8),
                                    child: Text(
                                      '${covid.deaths}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 16, 2, 4),
                                    child: Text('New: +${covid.todayDeaths}'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Recovered',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 16, 2, 8),
                                    child: Text(
                                      '${covid.recovered}',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Active',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 16, 2, 8),
                                    child: Text(
                                      '${covid.active}',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 2, 4, 8),
                        child: Text(
                            'Last Updated: ${DateTime.fromMillisecondsSinceEpoch(covid.updated)}'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            Container(
              height: 370,
              width: double.infinity,
            );
          }

          return Text('loading');
        });
  }
}
