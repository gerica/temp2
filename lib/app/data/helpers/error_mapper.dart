import 'package:flutter/services.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/app/data/model/app_exception.dart';

import 'get_error_title_and_descripton_helper.dart';

class ErrorMapper {
  static AppException from(dynamic e) => e is PlatformException
      ? AppException(exception: e, title: e.message)
      : e is OperationException
          ? AppException(
              exception: e,
              title: _graphQlErrorMapper(e.graphqlErrors),
              description: _graphQlErrorMapperDescription(e.graphqlErrors),
            )
          : e is NoSuchMethodError
              ? AppException(exception: e, title: 'Unexpected error')
              : AppException(exception: e, title: 'Error', description: e.toString());

  static String _graphQlErrorMapper(List<GraphQLError> errorList) {
    if (errorList.isEmpty) return 'Unexpected error'; //ToDo maybe customize this error message and export string

    if (errorList.length == 1) {
      return GetErrorTitleAndDescriptionHelper.getTitleError(errorList);
    } else
      return errorList.map<String>((e) => e.message).toList().join('; ');
  }

  static String _graphQlErrorMapperDescription(List<GraphQLError> errorList) {
    if (errorList.isEmpty) return 'Unexpected error'; //ToDo maybe customize this error message and export string

    if (errorList.length == 1) {
      return GetErrorTitleAndDescriptionHelper.getDescriptionError(errorList);
    } else
      return errorList.map<String>((e) => e.message).toList().join('; ');
  }
}
