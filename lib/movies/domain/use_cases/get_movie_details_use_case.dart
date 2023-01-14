import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/core/use_case/base_use_case.dart';
import 'package:movie_app_challenge/movies/data/models/movie_details_parameter.dart';
import 'package:movie_app_challenge/movies/domain/base_repository/base_movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_movie_details_use_case.dart';


class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameter>{

  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameter parameters)async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}

