import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:radio_life/core/data/data_sources/graphql_base.dart';

class UserUpdateMutation extends GraphqlBase {
  final String id;
  final String firstName;
  final String lastName;
  String? image;

  UserUpdateMutation({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.image,
  });

  Map<String, dynamic> get variables {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
    };
  }

  String _getParameters() {
    return r'''
     recordId
      record{
          _id
          firstName
          lastName
          email
          image
      }
    ''';
  }

  String _queryWithImage() {
    return r'''
         mutation UserUpdateById($id: MongoID!, $firstName: String!, $lastName: String!, $image: String!) {
             userUpdateById(_id:$id, record:{firstName:$firstName, lastName:$lastName, image:$image}) {         
      ''';
  }

  String _queryWithOutImage() {
    return r'''
         mutation UserUpdateById($id: MongoID!, $firstName: String!, $lastName: String!) {
             userUpdateById(_id:$id, record:{firstName:$firstName, lastName:$lastName}) {
      ''';
  }

  DocumentNode get document {
    var initQuery = _queryWithOutImage();
    if (image != null) {
      initQuery = _queryWithImage();
    }
    final query = initQuery + _getParameters() + r'}}';
    return gql(query);
  }
}
