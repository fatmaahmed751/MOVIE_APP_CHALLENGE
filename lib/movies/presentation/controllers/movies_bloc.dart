import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_challenge/core/use_case/base_use_case.dart';
import 'package:movie_app_challenge/core/utils/enums.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movies_event.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movies_states.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const EmptyParameters());
      //emit(const MoviesStates(nowPlayingState:RequestState.loaded));
      result.fold(
          (l) => emit(
                state.copyWith(
                    nowPlayingState: RequestState.error,
                    nowPlayingMessage: l.message),
              ),
          (r) => emit(
                state.copyWith(
                    nowPlayingMovies: r, nowPlayingState: RequestState.loaded),
              ));
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const EmptyParameters());
      //  emit(const MoviesStates(popularState:RequestState.loaded));
      result.fold(
          (l) => emit(
                state.copyWith(
                    popularState: RequestState.error,
                    popularMessage: l.message),
              ),
          (r) => emit(
                state.copyWith(
                  popularMovies: r,
                  popularState: RequestState.loaded,
                ),
              ));
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const EmptyParameters());
      result.fold(
        (l) => emit(
          state.copyWith(
              topRatedState: RequestState.error, topRatedMessage: l.message),
        ),
        (r) => emit(state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        )),
      );
    });
  }
}
