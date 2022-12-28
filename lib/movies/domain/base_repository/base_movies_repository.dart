 import 'package:dartz/dartz.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_movie_details_use_case.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>>getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetails>>getMovieDetails(MovieDetailsParameter parameters);

}