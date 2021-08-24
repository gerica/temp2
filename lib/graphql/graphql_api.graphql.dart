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
class UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface
    extends JsonSerializable with EquatableMixin {
  UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface();

  factory UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterfaceFromJson(json);

  String? message;

  @override
  List<Object?> get props => [message];
  Map<String, dynamic> toJson() =>
      _$UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterfaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$Mutation$UpdateByIdUserPayload$User extends JsonSerializable
    with EquatableMixin {
  UpdateUser$Mutation$UpdateByIdUserPayload$User();

  factory UpdateUser$Mutation$UpdateByIdUserPayload$User.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$Mutation$UpdateByIdUserPayload$UserFromJson(json);

  late String firstName;

  late String lastName;

  String? image;

  late String email;

  @override
  List<Object?> get props => [firstName, lastName, image, email];
  Map<String, dynamic> toJson() =>
      _$UpdateUser$Mutation$UpdateByIdUserPayload$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$Mutation$UpdateByIdUserPayload extends JsonSerializable
    with EquatableMixin {
  UpdateUser$Mutation$UpdateByIdUserPayload();

  factory UpdateUser$Mutation$UpdateByIdUserPayload.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$Mutation$UpdateByIdUserPayloadFromJson(json);

  UpdateUser$Mutation$UpdateByIdUserPayload$ErrorInterface? error;

  UpdateUser$Mutation$UpdateByIdUserPayload$User? record;

  @override
  List<Object?> get props => [error, record];
  Map<String, dynamic> toJson() =>
      _$UpdateUser$Mutation$UpdateByIdUserPayloadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$Mutation extends JsonSerializable with EquatableMixin {
  UpdateUser$Mutation();

  factory UpdateUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationFromJson(json);

  UpdateUser$Mutation$UpdateByIdUserPayload? userUpdateById;

  @override
  List<Object?> get props => [userUpdateById];
  Map<String, dynamic> toJson() => _$UpdateUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUser$Query$User extends JsonSerializable with EquatableMixin {
  GetUser$Query$User();

  factory GetUser$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetUser$Query$UserFromJson(json);

  @JsonKey(name: '_id')
  late String $id;

  late String firstName;

  late String lastName;

  late String email;

  String? image;

  bool? confirmed;

  @override
  List<Object?> get props =>
      [$id, firstName, lastName, email, image, confirmed];
  Map<String, dynamic> toJson() => _$GetUser$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUser$Query extends JsonSerializable with EquatableMixin {
  GetUser$Query();

  factory GetUser$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUser$QueryFromJson(json);

  GetUser$Query$User? userById;

  @override
  List<Object?> get props => [userById];
  Map<String, dynamic> toJson() => _$GetUser$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResetPassword$Mutation extends JsonSerializable with EquatableMixin {
  ResetPassword$Mutation();

  factory ResetPassword$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ResetPassword$MutationFromJson(json);

  String? userResetPassword;

  @override
  List<Object?> get props => [userResetPassword];
  Map<String, dynamic> toJson() => _$ResetPassword$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMyDevices$Query$MyDevice extends JsonSerializable with EquatableMixin {
  GetMyDevices$Query$MyDevice();

  factory GetMyDevices$Query$MyDevice.fromJson(Map<String, dynamic> json) =>
      _$GetMyDevices$Query$MyDeviceFromJson(json);

  String? name;

  String? locate;

  String? serialNumber;

  String? type;

  int? balance;

  String? status;

  DateTime? lastUpdate;

  @override
  List<Object?> get props =>
      [name, locate, serialNumber, type, balance, status, lastUpdate];
  Map<String, dynamic> toJson() => _$GetMyDevices$Query$MyDeviceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMyDevices$Query extends JsonSerializable with EquatableMixin {
  GetMyDevices$Query();

  factory GetMyDevices$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMyDevices$QueryFromJson(json);

  List<GetMyDevices$Query$MyDevice?>? myDevice;

  @override
  List<Object?> get props => [myDevice];
  Map<String, dynamic> toJson() => _$GetMyDevices$QueryToJson(this);
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
                  name: NameNode(value: 'record'),
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
                  name: NameNode(value: 'record'),
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
                  name: NameNode(value: 'record'),
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

@JsonSerializable(explicitToJson: true)
class UpdateUserArguments extends JsonSerializable with EquatableMixin {
  UpdateUserArguments(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.image});

  @override
  factory UpdateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserArgumentsFromJson(json);

  late String userId;

  late String firstName;

  late String lastName;

  late String image;

  @override
  List<Object?> get props => [userId, firstName, lastName, image];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserArgumentsToJson(this);
}

final UPDATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'userId')),
            type: NamedTypeNode(
                name: NameNode(value: 'MongoID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
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
            variable: VariableNode(name: NameNode(value: 'image')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'userUpdateById'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: '_id'),
                  value: VariableNode(name: NameNode(value: 'userId'))),
              ArgumentNode(
                  name: NameNode(value: 'record'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'firstName'),
                        value:
                            VariableNode(name: NameNode(value: 'firstName'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'lastName'),
                        value: VariableNode(name: NameNode(value: 'lastName'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'image'),
                        value: VariableNode(name: NameNode(value: 'image')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'error'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'message'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'record'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
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
                        name: NameNode(value: 'image'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class UpdateUserMutation
    extends GraphQLQuery<UpdateUser$Mutation, UpdateUserArguments> {
  UpdateUserMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = 'UpdateUser';

  @override
  final UpdateUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateUser$Mutation parse(Map<String, dynamic> json) =>
      UpdateUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserArguments extends JsonSerializable with EquatableMixin {
  GetUserArguments({required this.id});

  @override
  factory GetUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetUserArgumentsToJson(this);
}

final GET_USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type: NamedTypeNode(
                name: NameNode(value: 'MongoID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'userById'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: '_id'),
                  value: VariableNode(name: NameNode(value: 'id')))
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
                  name: NameNode(value: 'image'),
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

class GetUserQuery extends GraphQLQuery<GetUser$Query, GetUserArguments> {
  GetUserQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetUser';

  @override
  final GetUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUser$Query parse(Map<String, dynamic> json) =>
      GetUser$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordArguments extends JsonSerializable with EquatableMixin {
  ResetPasswordArguments({required this.email});

  @override
  factory ResetPasswordArguments.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordArgumentsFromJson(json);

  late String email;

  @override
  List<Object?> get props => [email];
  @override
  Map<String, dynamic> toJson() => _$ResetPasswordArgumentsToJson(this);
}

final RESET_PASSWORD_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ResetPassword'),
      variableDefinitions: [
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
            name: NameNode(value: 'userResetPassword'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'email'),
                  value: VariableNode(name: NameNode(value: 'email')))
            ],
            directives: [],
            selectionSet: null)
      ]))
]);

class ResetPasswordMutation
    extends GraphQLQuery<ResetPassword$Mutation, ResetPasswordArguments> {
  ResetPasswordMutation({required this.variables});

  @override
  final DocumentNode document = RESET_PASSWORD_MUTATION_DOCUMENT;

  @override
  final String operationName = 'ResetPassword';

  @override
  final ResetPasswordArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ResetPassword$Mutation parse(Map<String, dynamic> json) =>
      ResetPassword$Mutation.fromJson(json);
}

final GET_MY_DEVICES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMyDevices'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'myDevice'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'locate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'serialNumber'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'balance'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'lastUpdate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetMyDevicesQuery
    extends GraphQLQuery<GetMyDevices$Query, JsonSerializable> {
  GetMyDevicesQuery();

  @override
  final DocumentNode document = GET_MY_DEVICES_QUERY_DOCUMENT;

  @override
  final String operationName = 'GetMyDevices';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetMyDevices$Query parse(Map<String, dynamic> json) =>
      GetMyDevices$Query.fromJson(json);
}
