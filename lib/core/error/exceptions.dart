

import 'package:movie_app_challenge/core/network/error_message_model.dart';

class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;

   const ServerException({required this.errorMessageModel});

}

class LocalDataBaseException implements Exception{

  final ErrorMessageModel errorMessageModel;

  LocalDataBaseException(this.errorMessageModel);
}