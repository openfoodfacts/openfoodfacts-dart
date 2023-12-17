// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationErrors _$ValidationErrorsFromJson(Map<String, dynamic> json) =>
    ValidationErrors()
      ..detail = (json['detail'] as List<dynamic>?)
          ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ValidationErrorsToJson(ValidationErrors instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };
