//part of 'movie_details_bloc.dart';

//import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props =>[id];

}
class GetMovieRecommendationEvent extends MovieDetailsEvent{
  final int id;
  const GetMovieRecommendationEvent(this.id);
  @override
  List<Object?> get props =>[id];
}