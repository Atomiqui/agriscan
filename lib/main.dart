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
      home: const HomePage(),
      routes: {
        '/climate':(context) => const Climate(),
        '/aplications':(context) => const Aplications(),
        '/tillages':(context) => const Tillages(),
        '/reports':(context) => const Reports(),
      },
    )
  );
} 