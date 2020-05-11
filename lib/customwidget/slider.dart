import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 150.0,
          child: Carousel(
            borderRadius: true,
            boxFit: BoxFit.fill,
            images: [
              AssetImage('Images/sd1.jpg'),
              AssetImage('Images/sd2.jpg'),
            ],
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 4.0,
            indicatorBgPadding: 4.0,
            dotBgColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
