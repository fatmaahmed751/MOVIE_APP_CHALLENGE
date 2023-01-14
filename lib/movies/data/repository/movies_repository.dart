import 'package:dartz/dartz.dart';
import 'package:movie_app_challenge/core/error/exceptions.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_challenge/movies/data/models/movie_details_parameter.dart';
import 'package:movie_app_challenge/movies/data/models/recomendation_pararmeter.dart';
import 'package:movie_app_challenge/movies/domain/base_repository/base_movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';
import 'package:movie_app_challenge/movies/domain/entities/recommendation.dart';


 class MoviesRepository extends BaseMoviesRepository {

   final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

   @override
   Future<Either<Failure,List<Movie>>> getNowPlayingMovies()async {
  final result=await baseMovieRemoteDataSource.getNowPlayingMovies();
 try{
 return Right(result);
}
on ServerException catch (failure){
 return Left(ServerFailure(failure.errorMessageModel.statusMessage));
}

   }

   @override
   Future<Either<Failure,List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
     return Right(result);
    } on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
   }

    @override
    Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
     final result = await baseMovieRemoteDataSource.getTopRatedMovies();
     try {
      return Right(result);
     } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
     }
    }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(parameters)async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
/*
  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameter parameters)async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }*/
/*
  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters)async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }*/

   }