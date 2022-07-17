import 'package:gql/ast.dart';

abstract class GraphqlBase {
  Map<String, dynamic> get variables;
  DocumentNode get document;
}
