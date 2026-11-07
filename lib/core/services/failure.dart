import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errMessage: 'Bad certificate, please check your connection',
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to API server was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: 'No Internet Connection, Please check your network',
        );

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'Unexpected Error, Please try again!');

      default:
        return ServerFailure(
          errMessage: 'Opps There was an Error, Please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errMessage: response['error'] ?? 'Unauthorized request',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: 'Your request not found, Please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal server error, Please try later',
      );
    } else {
      return ServerFailure(
        errMessage: 'Oops, there was an error, please try again',
      );
    }
  }
}
