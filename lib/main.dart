import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie_app_challenge/core/services/service_locator.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
 ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Movies App",
      home:MoviesScreen(),
    );
  }
}

