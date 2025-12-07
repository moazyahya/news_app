import 'package:dio/dio.dart';

abstract class FaliureModel implements Exception {
  String errorMassege;
  int? errorCode;
  FaliureModel({required this.errorMassege, this.errorCode});
  @override
  String toString() {
    return errorMassege;
  }

  static FaliureModel getNetWorkError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        return BaseError(
          errorMassege: "Week Network Connection! ",
          errorCode: exception.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return BaseError(
          errorMassege: 'Server Error ',
          errorCode: exception.response?.statusCode,
        );

      case DioExceptionType.unknown:
        return BaseError(
          errorMassege: 'Something Wrong ',
          errorCode: exception.response?.statusCode,
        );
    }
  }
}

class BaseError extends FaliureModel {
  BaseError({required super.errorMassege, super.errorCode});
}
