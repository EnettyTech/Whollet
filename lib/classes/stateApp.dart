import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stateApp.g.dart';

@JsonSerializable(nullable: false)
class StateApp {
  final String name;
  final bool data;
  final DateTime dataCreated;
  StateApp({
    @required this.name,
    @required this.data,
    this.dataCreated,
  });

  factory StateApp.fromJson(Map<String, dynamic> json) =>
      _$StateAppFromJson(json);

  Map<String, dynamic> toJson() => _$StateAppToJson(this);
}
