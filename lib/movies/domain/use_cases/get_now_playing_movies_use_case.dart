import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/core/use_case/base_use_case.dart';
import 'package:movie_app_challenge/movies/domain/base_repository/base_movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';
class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,EmptyParameters>{

  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(EmptyParameters parameters) async{
    return  await baseMoviesRepository.getNowPlayingMovies();

  }


}