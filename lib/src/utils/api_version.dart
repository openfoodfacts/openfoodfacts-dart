/// Api version.
class ApiVersion {
  const ApiVersion(this.version);

  final num version;

  String getApiPath(final String subpath) => 'api/v$version/$subpath';
}
