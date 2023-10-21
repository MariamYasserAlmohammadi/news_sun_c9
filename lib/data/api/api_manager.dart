import 'dart:convert';

import 'package:http/http.dart' ;
import 'package:news_sun_c9/data/modal/SourcesResponse.dart';

abstract class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "e3b90a9b42bd43d8b8319fa7985232e9";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
   static Future <List<Source>> getSources()async{
       Uri url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=e3b90a9b42bd43d8b8319fa7985232e9");
       Response response = await get(url);
       // print(response.body);
       Map json = jsonDecode(response.body);
       SourcesResponse sourcesResponse =SourcesResponse.fromJson(json);
       if(response.statusCode >= 200 && response.statusCode <300 &&
           sourcesResponse.sources?.isNotEmpty == true ){
         return sourcesResponse.sources!;
       }
       throw Exception(sourcesResponse.message);

     }


  static getArticles(){

  }

}