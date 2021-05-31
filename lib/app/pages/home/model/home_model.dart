import 'package:flutter/foundation.dart';

@immutable
class HomeModel {
  final String? userFirstName;

  const HomeModel({this.userFirstName});

  HomeModel copyWith({
    String? userFirstName,
  }) =>
      HomeModel(
          userFirstName: userFirstName ?? this.userFirstName);
}
