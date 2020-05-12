import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icovid19tracker/customwidget/indiapanel.dart';
import 'package:icovid19tracker/customwidget/slider.dart';
import 'package:icovid19tracker/screens/indian_statelist.dart';

class IndiaDashboard extends StatefulWidget {
  @override
  _IndiaDashboardState createState() => _IndiaDashboardState();
}

class _IndiaDashboardState extends State<IndiaDashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SliderS(),
        IndiaPanel(),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IndianStatePage()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                height: 100,
                child: Center(
                    child: Text(
                      'StateWise Statatics',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              height: 100,
              child: Center(
                  child: Text(
                'District Statatics',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
            ),
          ),
        )
      ],
    );
  }
}
