/// Source Configuration for detection of apps (populates data sources on BE).
class SourceConfiguration {
  const SourceConfiguration({
    this.appName,
    this.appVersion,
    this.appUuid,
  });

  final String? appName;
  final String? appVersion;
  final String? appUuid;

  Map<String, String> getParameters() {
    final Map<String, String> result = <String, String>{};
    if (appName != null) {
      result['app_name'] = appName!;
    }
    if (appVersion != null) {
      result['app_version'] = appVersion!;
    }
    if (appUuid != null) {
      result['app_uuid'] = appUuid!;
    }
    return result;
  }
}
