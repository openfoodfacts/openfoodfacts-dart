import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

/// Tests around Events API.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  const String _knownUserId = 'ocervell';
  const String _unknownUserId = "o' * cervell";

  const Set<String> _typicalEventTypes = <String>{
    'invite_shared',
    'product_scanned',
    'product_added',
    'product_photo_added',
    'product_duplicate_found',
    'product_edited',
    'product_completed',
    'question_answered',
    'pr_merged',
    'translation_added',
  };

  void _checkEventsBase(final Iterable<EventsBase> list) {
    expect(list, isNotEmpty);
    bool withTimestamps = false;
    bool withBarcodes = false;
    bool withUserIds = false;
    bool withPoints = false;
    for (final EventsBase eventsBase in list) {
      if (eventsBase.timestamp != null) {
        withTimestamps = true;
      }
      if (eventsBase.barcode != null) {
        withBarcodes = true;
      }
      if (eventsBase.userId != null) {
        withUserIds = true;
      }
      if (eventsBase.points != null) {
        withPoints = true;
      }
    }
    expect(withTimestamps, isTrue);
    expect(withBarcodes, isTrue);
    expect(withUserIds, isTrue);
    expect(withPoints, isTrue);
  }

  void _checkEventsCount(final Map<String, int> map, final bool isEmpty) {
    expect(map, isNotEmpty);

    expect(map.keys.length, _typicalEventTypes.length);
    bool foundAllKeys = true;
    for (final String key in map.keys) {
      if (!_typicalEventTypes.contains(key)) {
        foundAllKeys = false;
      }
    }
    expect(foundAllKeys, isTrue);

    bool allZeros = true;
    for (final int value in map.values) {
      if (value != 0) {
        allZeros = false;
      }
    }
    expect(allZeros, isEmpty);
  }

  void _checkBadgeBase(final Iterable<BadgeBase> list) {
    expect(list, isNotEmpty);
    bool withUserIds = false;
    for (final BadgeBase badgeBase in list) {
      if (badgeBase.userId != null) {
        withUserIds = true;
      }
    }
    expect(withUserIds, isTrue);
  }

  int? _getLeaderboardScore(
    final String? userId,
    final List<LeaderboardEntry> list,
  ) {
    for (final LeaderboardEntry entry in list) {
      if (entry.userId == userId) {
        return entry.score;
      }
    }
    return null;
  }

  group('$OpenFoodAPIClient Events API', () {
    test('getEvents - all', () async {
      final List<EventsBase> result = await EventsAPIClient.getEvents();
      _checkEventsBase(result);
    });

    test('getEvents - known user', () async {
      final List<EventsBase> result =
          await EventsAPIClient.getEvents(userId: _knownUserId);
      _checkEventsBase(result);
    });

    test('getEvents - unknown user', () async {
      final List<EventsBase> result =
          await EventsAPIClient.getEvents(userId: _unknownUserId);
      expect(result, isEmpty);
    });

    test('getEventsCount - all', () async {
      final Map<String, int> result = await EventsAPIClient.getEventsCount();
      _checkEventsCount(result, false);
    });

    test('getEventsCount - known user', () async {
      final Map<String, int> result =
          await EventsAPIClient.getEventsCount(userId: _knownUserId);
      _checkEventsCount(result, false);
    });

    test('getEventsCount - unknown user', () async {
      final Map<String, int> result =
          await EventsAPIClient.getEventsCount(userId: _unknownUserId);
      _checkEventsCount(result, true);
    });

    test('getBadges - all', () async {
      final List<BadgeBase> result = await EventsAPIClient.getBadges();
      _checkBadgeBase(result);
    });

    test('getBadges - known user', () async {
      final List<BadgeBase> result =
          await EventsAPIClient.getBadges(userId: _knownUserId);
      _checkBadgeBase(result);
    });

    test('getBadges - unknown user', () async {
      final List<BadgeBase> result =
          await EventsAPIClient.getBadges(userId: _unknownUserId);
      expect(result, isEmpty);
    });

    test('getScores', () async {
      final int unknown =
          await EventsAPIClient.getScores(userId: _unknownUserId);
      expect(unknown, 0);

      final int all = await EventsAPIClient.getScores();
      final int known = await EventsAPIClient.getScores(userId: _knownUserId);
      expect(known, lessThanOrEqualTo(all));
      int sum = 0;
      for (final String eventType in _typicalEventTypes) {
        final int score = await EventsAPIClient.getScores(eventType: eventType);
        sum += score;
      }
      expect(sum, all);
    });

    test('getLeaderboard', () async {
      final List<LeaderboardEntry> result =
          await EventsAPIClient.getLeaderboard();
      final int knownTotal = _getLeaderboardScore(_knownUserId, result)!;
      final int nullTotal = _getLeaderboardScore(null, result)!;
      expect(_getLeaderboardScore(_unknownUserId, result), isNull);
      int knownSum = 0;
      int nullSum = 0;
      for (final String eventType in _typicalEventTypes) {
        final List<LeaderboardEntry> result =
            await EventsAPIClient.getLeaderboard(eventType: eventType);
        knownSum += _getLeaderboardScore(_knownUserId, result) ?? 0;
        nullSum += _getLeaderboardScore(null, result) ?? 0;
        expect(_getLeaderboardScore(_unknownUserId, result), isNull);
      }
      expect(knownSum, knownTotal);
      expect(nullSum, nullTotal);
    });
  });
}
