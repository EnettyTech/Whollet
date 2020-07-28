// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stateApp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateApp _$StateAppFromJson(Map<String, dynamic> json) {
  return StateApp(
    name: json['name'] as String,
    data: json['data'] as bool,
    dataCreated: DateTime.parse(json['dataCreated'] as String),
  );
}

Map<String, dynamic> _$StateAppToJson(StateApp instance) => <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'dataCreated': instance.dataCreated.toIso8601String(),
    };
