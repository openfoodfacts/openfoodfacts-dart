// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNutripatrolFlag _$CreateNutripatrolFlagFromJson(
        Map<String, dynamic> json) =>
    CreateNutripatrolFlag()
      ..ticket =
          NutripatrolTicket.fromJson(json['ticket'] as Map<String, dynamic>)
      ..id = (json['id'] as num).toInt();

Map<String, dynamic> _$CreateNutripatrolFlagToJson(
        CreateNutripatrolFlag instance) =>
    <String, dynamic>{
      'ticket': instance.ticket,
      'id': instance.id,
    };
