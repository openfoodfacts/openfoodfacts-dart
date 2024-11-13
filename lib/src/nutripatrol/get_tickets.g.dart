// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tickets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tickets _$TicketsFromJson(Map<String, dynamic> json) => Tickets()
  ..tickets = (json['tickets'] as List<dynamic>)
      .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
      .toList()
  ..maxPage = (json['max_page'] as num).toInt();

Map<String, dynamic> _$TicketsToJson(Tickets instance) => <String, dynamic>{
      'tickets': instance.tickets,
      'max_page': instance.maxPage,
    };
