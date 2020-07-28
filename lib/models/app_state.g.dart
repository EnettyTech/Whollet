// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitState _$InitStateFromJson(Map<String, dynamic> json) {
  return InitState(
    state: (json['state'] as List)
        .map((e) => StateApp.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InitStateToJson(InitState instance) => <String, dynamic>{
      'state': instance.state.map((e) => e.toJson()).toList(),
    };
