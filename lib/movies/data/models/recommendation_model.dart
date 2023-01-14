import 'package:movie_app_challenge/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
     super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String,dynamic>json)=>
      RecommendationModel(
        backdropPath: json["backdrop_path"]??'/r9PkFnRUIthgBp2JZZzD380MWZy.jpg',
        id:json["id"],
      );
}
