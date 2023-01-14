 import 'package:dartz/dartz.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/movies/data/models/movie_details_parameter.dart';
import 'package:movie_app_challenge/movies/data/models/recomendation_pararmeter.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';
import 'package:movie_app_challenge/movies/domain/entities/recommendation.dart';


abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>>getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetails>>getMovieDetails(MovieDetailsParameter parameters);
  Future<Either<Failure,List<Recommendation>>>getRecommendation(RecommendationParameters parameters);
}