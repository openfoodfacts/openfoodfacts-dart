// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RobotoffQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffQuestionResult _$RobotoffQuestionResultFromJson(
    Map<String, dynamic> json) {
  return RobotoffQuestionResult(
    status: json['status'] as String?,
    questions: RobotoffQuestion.fromJson(json['questions'] as List),
  );
}

Map<String, dynamic> _$RobotoffQuestionResultToJson(
    RobotoffQuestionResult instance) {
  final val = <String, dynamic>{
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('questions', RobotoffQuestion.toJson(instance.questions));
  return val;
}
