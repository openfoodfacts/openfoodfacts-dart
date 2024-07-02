/// Manager dedicated to "too many requests" server response.
///
/// Typically, the server may limit the number of requests to a [maxCount]
/// during a specific [duration].
class TooManyRequestsManager {
  TooManyRequestsManager({
    required this.maxCount,
    required this.duration,
  });

  final int maxCount;
  final Duration duration;

  final List<int> _requestTimestamps = <int>[];

  /// Waits the needed duration in order to avoid "too many requests" error.
  Future<void> waitIfNeeded() async {
    while (_requestTimestamps.length >= maxCount) {
      final int previousInMillis = _requestTimestamps.first;
      final int nowInMillis = DateTime.now().millisecondsSinceEpoch;
      final int waitingInMillis =
          duration.inMilliseconds - nowInMillis + previousInMillis;
      if (waitingInMillis > 0) {
        await Future.delayed(Duration(milliseconds: waitingInMillis));
      }
      _requestTimestamps.removeAt(0);
    }
    final DateTime now = DateTime.now();
    final int nowInMillis = now.millisecondsSinceEpoch;
    _requestTimestamps.add(nowInMillis);
  }
}

/// [TooManyRequestsManager] dedicated to "searchProducts" queries in PROD.
final TooManyRequestsManager searchProductsTooManyRequestsManager =
    TooManyRequestsManager(
  maxCount: 10,
  duration: Duration(minutes: 1),
);

/// [TooManyRequestsManager] dedicated to "getProduct" queries in PROD.
final TooManyRequestsManager getProductTooManyRequestsManager =
    TooManyRequestsManager(
  maxCount: 100,
  duration: Duration(minutes: 1),
);
