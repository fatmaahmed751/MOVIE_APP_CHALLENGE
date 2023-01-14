import 'package:equatable/equatable.dart';

class RecommendationParameters extends Equatable{
  final int id;

  const RecommendationParameters(this.id);

  @override

  List<Object?> get props => [id];
}