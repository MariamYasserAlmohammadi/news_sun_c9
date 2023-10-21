import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_sun_c9/data/modal/ArticlesResponse.dart';
import 'package:news_sun_c9/data/modal/SourcesResponse.dart';

abstract class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "e3b90a9b42bd43d8b8319fa7985232e9";

  static Future<List<Source>> getSources(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=e3b90a9b42bd43d8b8319fa7985232e9");
    Response response = await get(url);
    // print(response.body);
    Map json = jsonDecode(response.body);

    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        sourcesResponse.sources?.isNotEmpty == true) {
      return sourcesResponse.sources!;
    }
    throw Exception(sourcesResponse.message);
  }

  static Future<List<Article>> getArticles(String sourceId) async {
    try {
      Uri url = Uri.https(
          baseUrl, "/v2/everything",{"apiKey": apiKey, "sources": sourceId});
      Response serverResponse = await get(url);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          articlesResponse.articles?.isNotEmpty == true) {
        return articlesResponse.articles!;
      } else {
        throw Exception(articlesResponse.message);
      }
    } catch (_) {
      rethrow;
    }
  }
}
