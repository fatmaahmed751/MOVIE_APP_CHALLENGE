import 'dart:io';

import 'package:flutter/material.dart';

void main() {
 // ServicesLocator().init();
//  HttpOverrides.global =  HttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Movies App",
      //home:MoviesScreen(),
    );
  }
}

