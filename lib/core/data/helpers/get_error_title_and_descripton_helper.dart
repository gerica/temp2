import 'package:graphql/client.dart';

class GetErrorTitleAndDescriptionHelper {
  static String getTitleError(List<GraphQLError> errorList) => 'Error';

  static String getDescriptionError(List<GraphQLError> errorList) {
    final errorMessage = errorList.first.message;
    return errorMessage;
  }
}
