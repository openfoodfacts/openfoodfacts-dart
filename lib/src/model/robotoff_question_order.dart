import 'off_tagged.dart';

/// Order for Robotoff questions.
enum RobotoffQuestionOrder implements OffTagged {
  /// order by (descending) model confidence, null confidence insights come last
  confidence(offTag: 'confidence'),

  /// random order
  random(offTag: 'random'),

  /// order by (descending) popularity (=scan count)
  popularity(offTag: 'popularity');

  const RobotoffQuestionOrder({
    required this.offTag,
  });

  @override
  final String offTag;
}
