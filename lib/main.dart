import 'package:agriscan/pages/aplications.dart';
import 'package:agriscan/pages/climate.dart';
import 'package:agriscan/pages/home_page.dart';
import 'package:agriscan/pages/reports.dart';
import 'package:agriscan/pages/tillages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //title: "App",
      home: HomePage(),
      routes: {
        '/climate':(context) => Climate(),
        '/aplications':(context) => Aplications(),
        '/tillages':(context) => Tillages(),
        '/reports':(context) => Reports(),
      },
    )
  );
} 