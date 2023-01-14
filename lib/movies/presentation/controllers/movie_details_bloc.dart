import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_challenge/core/utils/enums.dart';
import 'package:movie_app_challenge/movies/data/models/movie_details_parameter.dart';
import 'package:movie_app_challenge/movies/data/models/recomendation_pararmeter.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_recommendation_use_case.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_event.dart';
import 'package:movie_app_challenge/movies/presentation/controllers/movie_details_state.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

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

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async
  {
    final result=await getRecommendationUseCase(RecommendationParameters( event.id));

    result.fold((l) => emit(
      state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message
      ),
    ), (r) =>emit(
      state.copyWith(
          recommendationState: RequestState.loaded,
          recommendationMovies:r
      ),
    ));
  }
}

