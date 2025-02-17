// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tickets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutripatrolTickets _$NutripatrolTicketsFromJson(Map<String, dynamic> json) =>
    NutripatrolTickets()
      ..tickets = (json['tickets'] as List<dynamic>)
          .map((e) => NutripatrolTicket.fromJson(e as Map<String, dynamic>))
          .toList()
      ..maxPage = (json['max_page'] as num).toInt();

Map<String, dynamic> _$NutripatrolTicketsToJson(NutripatrolTickets instance) =>
    <String, dynamic>{
      'tickets': instance.tickets,
      'max_page': instance.maxPage,
    };
