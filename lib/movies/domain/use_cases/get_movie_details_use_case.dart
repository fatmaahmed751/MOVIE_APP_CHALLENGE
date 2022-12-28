import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/core/use_case/base_use_case.dart';
import 'package:movie_app_challenge/movies/domain/base_repository/base_movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';


class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameter>{

  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameter parameters)async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}


class MovieDetailsParameter extends Equatable {

  final int id;

  const MovieDetailsParameter({required this.id});

  @override
  List<Object?> get props => [id];
}