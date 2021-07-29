// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangePassword$Mutation$User extends JsonSerializable
    with EquatableMixin {
  ChangePassword$Mutation$User();

  factory ChangePassword$Mutation$User.fromJson(Map<String, dynamic> json) =>
      _$ChangePassword$Mutation$UserFromJson(json);

  @JsonKey(name: '_id')
  late String $id;

  String? token;

  late String firstName;

  late String lastName;

  late String email;

  bool? confirmed;

  @override
  List<Object?> get props =>
      [$id, token, firstName, lastName, email, confirmed];
  Map<String, dynamic> toJson() => _$ChangePassword$Mutation$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangePassword$Mutation extends JsonSerializable with EquatableMixin {
  ChangePassword$Mutation();

  factory ChangePassword$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ChangePassword$MutationFromJson(json);

  ChangePassword$Mutation$User? userChangePassword;

  @override
  List<Object?> get props => [userChangePassword];
  Map<String, dynamic> toJson() => _$ChangePassword$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation$User extends JsonSerializable with EquatableMixin {
  SignIn$Mutation$User();

  factory SignIn$Mutation$User.fromJson(Map<String, dynamic> json) =>
      _$SignIn$Mutation$UserFromJson(json);

  @JsonKey(name: '_id')
  late String $id;

  String? token;

  late String firstName;

  late String lastName;

  late String email;

  bool? confirmed;

  @override
  List<Object?> get props =>
      [$id, token, firstName, lastName, email, confirmed];
  Map<String, dynamic> toJson() => _$SignIn$Mutation$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation extends JsonSerializable with EquatableMixin {
  SignIn$Mutation();

  factory SignIn$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignIn$MutationFromJson(json);

  SignIn$Mutation$User? userLogin;

  @override
  List<Object?> get props => [userLogin];
  Map<String, dynamic> toJson() => _$SignIn$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUp$Mutation extends JsonSerializable with EquatableMixin {
  SignUp$Mutation();

  factory SignUp$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignUp$MutationFromJson(json);

  String? userRegister;

  @override
  List<Object?> get props => [userRegister];
  Map<String, dynamic> toJson() => _$SignUp$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangePasswordArguments extends JsonSerializable with EquatableMixin {
  ChangePasswordArguments(
      {required this.currentPassword, required this.newPassword});

  @override
  factory ChangePasswordArguments.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordArgumentsFromJson(json);

  late String currentPassword;

  late String newPassword;

  @override
  List<Object?> get props => [currentPassword, newPassword];
  @override
  Map<String, dynamic> toJson() => _$ChangePasswordArgumentsToJson(this);
}

final CHANGE_PASSWORD_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ChangePassword'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'currentPassword')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'newPassword')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'userChangePassword'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'newPassword'),
                        value:
                            VariableNode(name: NameNode(value: 'newPassword'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'oldPassword'),
                        value: VariableNode(
                            name: NameNode(value: 'currentPassword')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'confirmed'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class ChangePasswordMutation
    extends GraphQLQuery<ChangePassword$Mutation, ChangePasswordArguments> {
  ChangePasswordMutation({required this.variables});

  @override
  final DocumentNode document = CHANGE_PASSWORD_MUTATION_DOCUMENT;

  @override
  final String operationName = 'ChangePassword';

  @override
  final ChangePasswordArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ChangePassword$Mutation parse(Map<String, dynamic> json) =>
      ChangePassword$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignInArguments extends JsonSerializable with EquatableMixin {
  SignInArguments({required this.email, required this.password});

  @override
  factory SignInArguments.fromJson(Map<String, dynamic> json) =>
      _$SignInArgumentsFromJson(json);

  late String email;

  late String password;

  @override
  List<Object?> get props => [email, password];
  @override
  Map<String, dynamic> toJson() => _$SignInArgumentsToJson(this);
}

final SIGN_IN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SignIn'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'password')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'userLogin'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'email'),
                        value: VariableNode(name: NameNode(value: 'email'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'password'),
                        value: VariableNode(name: NameNode(value: 'password')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'firstName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'confirmed'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class SignInMutation extends GraphQLQuery<SignIn$Mutation, SignInArguments> {
  SignInMutation({required this.variables});

  @override
  final DocumentNode document = SIGN_IN_MUTATION_DOCUMENT;

  @override
  final String operationName = 'SignIn';

  @override
  final SignInArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SignIn$Mutation parse(Map<String, dynamic> json) =>
      SignIn$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignUpArguments extends JsonSerializable with EquatableMixin {
  SignUpArguments(
      {required this.firstName, required this.lastName, required this.email});

  @override
  factory SignUpArguments.fromJson(Map<String, dynamic> json) =>
      _$SignUpArgumentsFromJson(json);

  late String firstName;

  late String lastName;

  late String email;

  @override
  List<Object?> get props => [firstName, lastName, email];
  @override
  Map<String, dynamic> toJson() => _$SignUpArgumentsToJson(this);
}

final SIGN_UP_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SignUp'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'firstName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'lastName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'userRegister'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'firstName'),
                        value:
                            VariableNode(name: NameNode(value: 'firstName'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'lastName'),
                        value: VariableNode(name: NameNode(value: 'lastName'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'email'),
                        value: VariableNode(name: NameNode(value: 'email')))
                  ]))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class SignUpMutation extends GraphQLQuery<SignUp$Mutation, SignUpArguments> {
  SignUpMutation({required this.variables});

  @override
  final DocumentNode document = SIGN_UP_MUTATION_DOCUMENT;

  @override
  final String operationName = 'SignUp';

  @override
  final SignUpArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SignUp$Mutation parse(Map<String, dynamic> json) =>
      SignUp$Mutation.fromJson(json);
}
