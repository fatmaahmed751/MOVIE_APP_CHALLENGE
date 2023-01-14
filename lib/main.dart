import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_challenge/core/services/service_locator.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_event.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movies_bloc.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movies_event.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movies_states.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
 ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
 return MultiBlocProvider(
   providers:[
     BlocProvider(
       create: (context)=>sl<MoviesBloc>()..add(GetTopRatedMoviesEvent())..add(GetNowPlayingMoviesEvent()
       )..add(GetPopularMoviesEvent()),
     ),
     BlocProvider(create:(context)=>sl<MovieDetailsBloc>() ),
   ],
   child: BlocConsumer<MoviesBloc,MoviesStates>(
     listener: (context,state){},
     builder: (context,state){
       return const MaterialApp(
         debugShowCheckedModeBanner: false,
         title:"Movies App",
         home:MoviesScreen(),
       );
     },
   ),
 );
  }
}

