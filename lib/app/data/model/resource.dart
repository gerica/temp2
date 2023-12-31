import 'dart:async';

import 'package:graphql/client.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/pages/profile/profile_controller.dart';

import 'app_exception.dart';

class Resource<T> {
  final Status status;
  final T? data;
  final AppException? error;

  // ignore: prefer_function_declarations_over_variables
  static AppException Function(dynamic e) _errorMapper =
      (e) => AppException(exception: e, title: 'Error', description: e.toString());

  const Resource({
    required this.status,
    this.data,
    this.error,
  });

  static void setErrorMapper(AppException Function(dynamic e) errorMapper) {
    _errorMapper = errorMapper;
  }

  static Resource<T> loading<T>({T? data}) => Resource<T>(data: data, status: Status.loading);

  static Resource<T> failed<T>({dynamic error, T? data}) => Resource<T>(
        error: error,
        data: data,
        status: Status.failed,
      );

  static Resource<T> success<T>({T? data}) => Resource<T>(data: data, status: Status.success);

  static Future<Resource<T>> asFuture<T>(Future<dynamic> Function() req, FutureOr<T> Function(dynamic data) res) async {
    try {
      final result = await req();
      if (result is QueryResult) {
        if (result.hasException && result.exception != null) {
          final firstException = result.exception?.graphqlErrors.first;
          if (firstException != null && firstException.message == 'Please Login Again!') {
            final profile = await ProfileController.to;
            await profile.logout();
          }

          final _errorMapped = _errorMapper(result.exception);
          print(result.exception.toString());

          if (_errorMapped.description != null) {
            final tempDesc = _errorMapped.description!;

            if (tempDesc.contains('User Already Exists!') || tempDesc.contains('Wrong Password!')) {
              _errorMapped.title = 'Warning';
            }
          }
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
