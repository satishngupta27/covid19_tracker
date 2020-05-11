import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndiaPanel extends StatefulWidget {
  @override
  _IndiaPanelState createState() => _IndiaPanelState();
}

class _IndiaPanelState extends State<IndiaPanel> {
  var total;
  var recovered;
  var deaths;
  var active;
  var lastUpdate;

  Future<void> getIndiaData() async {
    http.Response response =
        await http.get("https://api.rootnet.in/covid19-in/stats/latest");
    var results = jsonDecode(response.body);
    setState(() {
      this.total = results['data']['unofficial-summary'][0]['total'];
      this.recovered = results['data']['unofficial-summary'][0]['recovered'];
      this.deaths = results['data']['unofficial-summary'][0]['deaths'];
      this.active = results['data']['unofficial-summary'][0]['active'];
      this.lastUpdate = results['lastOriginUpdate'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getIndiaData();
  }

  @override
  Widget build(BuildContext context) {
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
                      'Images/indf.png',
                      height: 30,
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Text(
                        "CoronaVirus India",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ],
                ),
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
                          //color: Colors.redAccent.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
                            child: Text(
                              total != null ? total.toString() : "loading",
                              style: TextStyle(
                                  color: Colors.deepPurple,
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
                            'Deaths',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
                            child: Text(
                              deaths != null ? deaths.toString() : "loading",
                              style: TextStyle(
                                  color: Colors.red,
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
                            'Recovered',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
                            child: Text(
                              recovered != null
                                  ? recovered.toString()
                                  : "loading",
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
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
                            child: Text(
                              active != null ? active.toString() : "loading",
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
                child: Text(lastUpdate != null
                    ? "LastUpdated: " + lastUpdate
                    : "loading"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
