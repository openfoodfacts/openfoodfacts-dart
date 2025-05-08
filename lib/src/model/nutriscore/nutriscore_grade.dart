import 'package:json_annotation/json_annotation.dart';

import '../off_tagged.dart';

/// Grade of NutriScore.
enum NutriScoreGrade implements OffTagged {
  @JsonValue('a')
  a('a'),
  @JsonValue('b')
  b('b'),
  @JsonValue('c')
  c('c'),
  @JsonValue('d')
  d('d'),
  @JsonValue('e')
  e('e'),
  @JsonValue('not-applicable')
  notApplicable('not-applicable'),
  ;

  const NutriScoreGrade(this.offTag);

  @override
  final String offTag;

  /// Returns the first [NutriScoreGrade] that matches the [offTag].
  static NutriScoreGrade? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, NutriScoreGrade.values) as NutriScoreGrade?;
}
