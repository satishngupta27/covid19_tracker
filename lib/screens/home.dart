import 'package:flutter/material.dart';
import 'package:icovid19tracker/screens/dashboard.dart';
import 'package:icovid19tracker/screens/indiadashboard.dart';
import 'package:icovid19tracker/screens/infos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOption = [
    IndiaDashboard(),
    DashBoard(),
    Infos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pageOption[_selectedPage]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('India'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Text('Global'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Info'),
          ),
        ],
      ),
    );
  }
}
