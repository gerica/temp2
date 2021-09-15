import 'dart:async';

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/domain/use_cases/auth/log_out_use_case.dart';
import 'package:radio_life/di/di.dart';

import 'app_exception.dart';

class Resource<T> {
  final Status status;
  final T? data;
  final AppException? error;

  // ignore: prefer_function_declarations_over_variables
  static AppException Function(dynamic e) _errorMapper =
      (e) => AppException(exception: e, title: e.toString());

  const Resource({
    required this.status,
    this.data,
    this.error,
  });

  static void setErrorMapper(AppException Function(dynamic e) errorMapper) {
    _errorMapper = errorMapper;
  }

  static Resource<T> loading<T>({T? data}) =>
      Resource<T>(data: data, status: Status.loading);

  static Resource<T> failed<T>({dynamic error, T? data}) => Resource<T>(
        error: error,
        data: data,
        status: Status.failed,
      );

  static Resource<T> success<T>({T? data}) =>
      Resource<T>(data: data, status: Status.success);

  static Future<Resource<T>> asFuture<T>(Future<dynamic> Function() req,
      FutureOr<T> Function(dynamic data) res) async {
    try {
      final result = await req();
      if (result is QueryResult) {
        if (result.hasException && result.exception != null) {
          final firstException = result.exception?.graphqlErrors.first;
          if (firstException != null &&
              firstException.message == 'Please Login Again!') {
            final _logout = getIt<LogOutUseCase>();
            await _logout();
          }

          final _errorMapped = _errorMapper(result.exception);
          print(result.exception.toString());
          return failed(
            error: _errorMapped,
            data: _errorMapped.data is T ? _errorMapped.data : null,
          );
        } else
          return success<T>(data: await res(result.data));
      }
      return success<T>(data: await res(result));
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final _errorMapped = _errorMapper(e);
      print(e.toString());
      return failed(
        error: _errorMapped,
        data: _errorMapped.data is T ? _errorMapped.data : null,
      );
    }
  }
}
