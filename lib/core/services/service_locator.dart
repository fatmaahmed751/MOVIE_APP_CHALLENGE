import 'package:get_it/get_it.dart';
import 'package:movie_app_challenge/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_challenge/movies/data/repository/movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/base_repository/base_movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{

void init(){

  sl.registerFactory(()=>MoviesBloc(sl(),sl(),sl()));
  sl.registerFactory(()=>MovieDetailsBloc(sl()));

  //data
  sl.registerLazySingleton<BaseMovieRemoteDataSource>(()=>MovieRemoteDataSource());


  //repository
 sl.registerLazySingleton<BaseMoviesRepository>(()=>MoviesRepository(sl()));

 //usecases
  sl.registerLazySingleton(()=>GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(()=>GetMovieDetailsUseCase(sl()));


  }
}