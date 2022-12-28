import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_challenge/core/utils/enums.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_event.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_state.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async
  {
    final result=await getMovieDetailsUseCase(MovieDetailsParameter(id: event.id));

    result.fold((l) => emit(
      state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailMessage: l.message
      ),
    ), (r) =>emit(
        state.copyWith(
            movieDetailsState: RequestState.loaded,
            movieDetails:r
        ),
    ));
  }
}

