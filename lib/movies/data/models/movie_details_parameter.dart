
import 'package:equatable/equatable.dart';

class MovieDetailsParameter extends Equatable {

  final int id;

  const MovieDetailsParameter({required this.id});

  @override
  List<Object?> get props => [id];
}