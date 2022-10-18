import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

/// Tests around Events API.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  const String knownUserId = 'ocervell';
  const String unknownUserId = "o' * cervell";

  const Set<String> typicalEventTypes = <String>{
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

  void checkEventsBase(final Iterable<EventsBase> list) {
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

  void checkEventsCount(final Map<String, int> map, final bool isEmpty) {
    expect(map, isNotEmpty);

    expect(map.keys.length, typicalEventTypes.length);
    bool foundAllKeys = true;
    for (final String key in map.keys) {
      if (!typicalEventTypes.contains(key)) {
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

  void checkBadgeBase(final Iterable<BadgeBase> list) {
    expect(list, isNotEmpty);
    bool withUserIds = false;
    for (final BadgeBase badgeBase in list) {
      if (badgeBase.userId != null) {
        withUserIds = true;
      }
    }
    expect(withUserIds, isTrue);
  }

  int? getLeaderboardScore(
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
      checkEventsBase(result);
    });

    test('getEvents - known user', () async {
      final List<EventsBase> result =
          await EventsAPIClient.getEvents(userId: knownUserId);
      checkEventsBase(result);
    });

    test('getEvents - unknown user', () async {
      final List<EventsBase> result =
          await EventsAPIClient.getEvents(userId: unknownUserId);
      expect(result, isEmpty);
    });

    test('getEventsCount - all', () async {
      final Map<String, int> result = await EventsAPIClient.getEventsCount();
      checkEventsCount(result, false);
    });

    test('getEventsCount - known user', () async {
      final Map<String, int> result =
          await EventsAPIClient.getEventsCount(userId: knownUserId);
      checkEventsCount(result, false);
    });

    test('getEventsCount - unknown user', () async {
      final Map<String, int> result =
          await EventsAPIClient.getEventsCount(userId: unknownUserId);
      checkEventsCount(result, true);
    });

    test('getBadges - all', () async {
      final List<BadgeBase> result = await EventsAPIClient.getBadges();
      checkBadgeBase(result);
    });

    test('getBadges - known user', () async {
      final List<BadgeBase> result =
          await EventsAPIClient.getBadges(userId: knownUserId);
      checkBadgeBase(result);
    });

    test('getBadges - unknown user', () async {
      final List<BadgeBase> result =
          await EventsAPIClient.getBadges(userId: unknownUserId);
      expect(result, isEmpty);
    });

    test('getScores', () async {
      final int unknown =
          await EventsAPIClient.getScores(userId: unknownUserId);
      expect(unknown, 0);

      final int all = await EventsAPIClient.getScores();
      final int known = await EventsAPIClient.getScores(userId: knownUserId);
      expect(known, lessThanOrEqualTo(all));
      int sum = 0;
      for (final String eventType in typicalEventTypes) {
        final int score = await EventsAPIClient.getScores(eventType: eventType);
        sum += score;
      }
      expect(sum, all);
    });

    test('getLeaderboard', () async {
      final List<LeaderboardEntry> result =
          await EventsAPIClient.getLeaderboard();
      final int knownTotal = getLeaderboardScore(knownUserId, result)!;
      final int nullTotal = getLeaderboardScore(null, result)!;
      expect(getLeaderboardScore(unknownUserId, result), isNull);
      int knownSum = 0;
      int nullSum = 0;
      for (final String eventType in typicalEventTypes) {
        final List<LeaderboardEntry> result =
            await EventsAPIClient.getLeaderboard(eventType: eventType);
        knownSum += getLeaderboardScore(knownUserId, result) ?? 0;
        nullSum += getLeaderboardScore(null, result) ?? 0;
        expect(getLeaderboardScore(unknownUserId, result), isNull);
      }
      expect(knownSum, knownTotal);
      expect(nullSum, nullTotal);
    });
  });
}
