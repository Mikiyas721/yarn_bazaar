class RestRequest {
  final String url;
  final Map<String, String>? headers;
  final Map<String, String>? params;
  final dynamic data;
  final Map<String, dynamic>? query;
  final int? timeout;

  RestRequest({
    required this.url,
    this.headers,
    this.params,
    this.data,
    this.timeout,
    this.query,
  });
}
