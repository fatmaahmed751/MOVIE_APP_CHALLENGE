import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_challenge/core/error/exceptions.dart';
import 'package:movie_app_challenge/core/network/error_message_model.dart';
import 'package:movie_app_challenge/core/utils/app_constants/constants.dart';
import 'package:movie_app_challenge/movies/data/models/movie_details_model.dart';
import 'package:movie_app_challenge/movies/data/models/movie_details_parameter.dart';
import 'package:movie_app_challenge/movies/data/models/movie_model.dart';
import 'package:movie_app_challenge/movies/data/models/recomendation_pararmeter.dart';
import 'package:movie_app_challenge/movies/data/models/recommendation_model.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_recommendation_use_case.dart';


 abstract class BaseMovieRemoteDataSource{
   Future<List<MovieModel>> getNowPlayingMovies();
   Future<List<MovieModel>> getPopularMovies();
   Future<List<MovieModel>> getTopRatedMovies();
   Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameters);
   Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);

 }

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  Dio dio = Dio();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final response = await Dio().get(
        AppConstance.mowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"] as List).map((e) =>
              MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
        AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"] as List).map((e) =>
              MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
        AppConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"] as List).map((e) =>
              MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameter parameters) async {
    final response = await Dio().get(
        AppConstance.movieDetailsPath(parameters.id));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(
        AppConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map((e) =>
              RecommendationModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }
}