import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

sealed class ApiException implements Exception {
  const ApiException._();

  factory ApiException.fromDioException(DioException exception) {
    final response = exception.response;
    switch (exception.type) {
      case DioExceptionType.badResponse when response != null:
        final data = response.data;
        if (data is! Map<String, dynamic>) {
          return ApiUnknownResponseException(
            statusCode: response.statusCode,
            data: data,
          );
        }
        try {
          final errorResponse = ErrorResponse.fromJson(data);
          return ApiErrorResponseException(
            errorResponse: errorResponse,
            statusCode: response.statusCode ?? 0,
          );
        } on CheckedFromJsonException {
          return ApiUnknownResponseException(
            statusCode: response.statusCode,
            data: data,
          );
        }
      case DioExceptionType.connectionTimeout:
        return const ApiNetworkException(type: NetworkExceptionType.timeout);
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiNetworkException(
          type: NetworkExceptionType.connectionError,
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return ApiUnknownResponseException(
          statusCode: exception.response?.statusCode ?? 0,
          data: exception.response?.data,
        );
    }
  }

  static Future<T> transform<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}

class ApiNetworkException extends ApiException {
  const ApiNetworkException({
    required this.type,
  }) : super._();

  final NetworkExceptionType type;

  @override
  String toString() => 'ApiNetworkException(type: $type)';
}

enum NetworkExceptionType {
  timeout,
  connectionError,
  unknown,
}

class ApiErrorResponseException extends ApiException {
  const ApiErrorResponseException({
    required this.errorResponse,
    required this.statusCode,
  }) : super._();

  final ErrorResponse errorResponse;
  final int statusCode;

  @override
  String toString() =>
      '${errorResponse.code.name.toUpperCase()}: ${errorResponse.message}';
}

class ApiUnknownResponseException extends ApiException {
  const ApiUnknownResponseException({
    required this.data,
    this.statusCode,
  }) : super._();

  final int? statusCode;
  final Object? data;

  @override
  String toString() =>
      'ApiUnknownResponseException(statusCode: $statusCode, data: $data)';
}

extension ApiExceptionExtension on ApiException {
  String errorMessage(Translations t) => switch (this) {
    ApiNetworkException() => t.common.error.server.message,
    ApiErrorResponseException(:final errorResponse) =>
      '${errorResponse.code.name.toUpperCase()}: ${errorResponse.message}',
    ApiUnknownResponseException() => t.common.error.general.occurred,
  };
}
