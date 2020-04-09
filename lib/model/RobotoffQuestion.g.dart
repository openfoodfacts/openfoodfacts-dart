// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RobotoffQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffQuestionResult _$RobotoffQuestionResultFromJson(
    Map<String, dynamic> json) {
  return RobotoffQuestionResult(
    status: json['status'] as String,
    questions: (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : RobotoffQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RobotoffQuestionResultToJson(
        RobotoffQuestionResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'questions': instance.questions,
    };
