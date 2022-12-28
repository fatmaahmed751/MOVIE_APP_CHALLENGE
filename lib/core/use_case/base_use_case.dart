import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_challenge/core/error/failure.dart';

abstract class BaseUseCase<T, Parameters>{
  Future<Either<Failure,T>>call(Parameters parameters);
}

class EmptyParameters extends Equatable{
  const EmptyParameters();
  @override
  List<Object?> get props => [];

}