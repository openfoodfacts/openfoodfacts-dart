/// Api version.
class ApiVersion {
  const ApiVersion(this.version);

  final num version;

  String getApiPath(String subpath) => 'api/v$version/$subpath';
}
