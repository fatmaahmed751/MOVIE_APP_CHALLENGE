import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/error/failure.dart';
import 'package:movie_app_challenge/core/use_case/base_use_case.dart';
import 'package:movie_app_challenge/movies/data/models/recomendation_pararmeter.dart';
import 'package:movie_app_challenge/movies/domain/base_repository/base_movies_repository.dart';
import 'package:movie_app_challenge/movies/domain/entities/recommendation.dart';
import 'package:movie_app_challenge/movies/domain/use_cases/get_recommendation_use_case.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{

  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters)async {
   return await baseMoviesRepository.getRecommendation(parameters);
  }




}
