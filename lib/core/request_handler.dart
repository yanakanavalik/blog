import 'package:http/http.dart' as http;

class RequestHandler {
  static const _localServerUrl = "http://localhost:8080";
  static const _serverUrl = "https://valencia-329402.wl.r.appspot.com";

  static Future<http.Response> getSummaries({
    required int offset,
    required int limit,
  }) =>
      http.get(
        Uri.parse(
            '$_serverUrl/articles-summaries?start=$offset&limit=$limit'),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      );

  static Future<http.Response> getArticleById({
    required int id,
  }) =>
      http.get(
        Uri.parse('$_serverUrl/article?id=$id'),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
      );
}
