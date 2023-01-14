

import 'package:movie_app_challenge/movies/data/models/genres_model.dart';
import 'package:movie_app_challenge/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
 const  MovieDetailsModel({
   required  super.backdropPath,
   required super.id,
   required super.genres,
   required super.overView,
   required super.releaseDate,
   required super.runTime,
   required super.title,
   required super.voteAverage});

 factory MovieDetailsModel.fromJson(Map<String,dynamic>json)=>
     MovieDetailsModel(
         backdropPath: json["backdrop_path"],
         id:  json["id"],
         genres:List<GenresModel>.from(json["genres"].map((e)=>GenresModel.fromJson(e))),
         overView:  json["overview"],
         releaseDate:  json["release_date"],
         runTime:  json["runtime"],
         title:  json["title"],
        voteAverage: json["vote_average"],
 );

}