import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icovid19tracker/screens/faqpage.dart';
import 'package:icovid19tracker/screens/preventive.dart';
import 'package:icovid19tracker/screens/symptoms.dart';

class Infos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Symptoms()));
            },
            child: Card(
              child: Container(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                              child: Image.asset(
                                'Images/symptoms.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              )),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 110, 8),
                              child: Text(
                                'Symptoms',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 30, 8),
                              child: Text(
                                "The covid 19 virsus can\naffects different people in\ndifferent ways.",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Preventive()));
            },
            child: Card(
              child: Container(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: Image.asset(
                                'Images/prevention.jpg',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 20, 8),
                              child: Text(
                                'Preventive Measures',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 30, 8),
                              child: Text(
                                "Check how to prevent\ninfection and to slow\ntransmission of covid 19.",
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
        Divider(),
        Text(
          'Advise from WHO',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 550,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/people.jpg',
                      height: 120,
                    ),
                    Text('Advise for people')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/healthworker.jpg',
                      height: 100,
                    ),
                    Text('Advise for Health Worker')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/scam.jpg',
                      height: 120,
                    ),
                    Text('Scam Alert')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/myth.jpg',
                      height: 120,
                    ),
                    Text('Myth Buster')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FAQPage()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'Images/faq.jpg',
                        height: 100,
                      ),
                      Text('FAQs')
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/faq.jpg',
                      height: 100,
                    ),
                    Text('FAQs')
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
