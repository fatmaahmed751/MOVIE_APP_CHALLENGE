
//part of 'movie_details_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/utils/enums.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';
import 'package:movie_app_challenge/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailMessage;
  final List<Recommendation> recommendationMovies;
  final RequestState recommendationState ;
  final String recommendationMessage;

  const MovieDetailsState({
    this.recommendationMovies=const[],
    this.recommendationMessage='',
    this.recommendationState=RequestState.loading,
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailMessage = ''
  });

  MovieDetailsState copyWith({
     MovieDetails? movieDetails,
     RequestState? movieDetailsState,
     String? movieDetailMessage,
    List<Recommendation>? recommendationMovies,
    RequestState? recommendationState,
    String? recommendationMessage,
}){
  return  MovieDetailsState(
      movieDetails:movieDetails??this.movieDetails,
      movieDetailsState:movieDetailsState??this.movieDetailsState,
      movieDetailMessage:movieDetailMessage??this.movieDetailMessage,
    recommendationMessage: recommendationMessage??this.recommendationMessage,
    recommendationMovies: recommendationMovies??this.recommendationMovies,
    recommendationState: recommendationState??this.recommendationState,
  );

}
  @override
  List<Object?> get props => [movieDetails, movieDetailsState, movieDetailMessage,
  recommendationMessage,recommendationMovies,recommendationState];

}
