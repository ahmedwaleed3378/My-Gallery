import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  const Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);
  factory ServerFailure.formDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.cancel:
        return ServerFailure('Your Request with ApiServer was canceled');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure('Failed to authenticate with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure('There was a Connection error with the Server');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('Check your internet connection please');
        }
        return ServerFailure('There was an unkown error with the Server');
      default:
        return ServerFailure('There was an unkown error with the Server');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic respone) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respone['error']['message']);
    } else if (statusCode == 403) {
      return ServerFailure('Your Request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, please try again later!');
    } else {
      return ServerFailure('Oops! There was an error, please try again later');
    }
  }
}
