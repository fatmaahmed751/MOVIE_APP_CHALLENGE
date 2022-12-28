
//part of 'movie_details_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/utils/enums.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailMessage = ''
  });

  MovieDetailsState copyWith({
     MovieDetails? movieDetails,
     RequestState? movieDetailsState,
     String? movieDetailMessage,
}){
  return  MovieDetailsState(
      movieDetails:movieDetails??this.movieDetails,
      movieDetailsState:movieDetailsState??this.movieDetailsState,
      movieDetailMessage:movieDetailMessage??this.movieDetailMessage
  );

}
  @override
  List<Object?> get props => [movieDetails, movieDetailsState, movieDetailMessage];

}
