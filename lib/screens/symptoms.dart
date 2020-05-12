import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Symptoms'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "People with mild symptoms who are otherwise healthy should manage their symptoms at home.\n\nOn average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days."),
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }

}
