import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_sun_c9/data/modal/SourcesResponse.dart';
abstract class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "e3b90a9b42bd43d8b8319fa7985232e9";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
   static Future <List<Source>> getSources()async{
     try{
       Uri url =Uri.parse("https://${baseUrl}$sourcesEndPoint?apiKey=$apiKey}");
       http.Response response = await http.get(url);
       Map json = jsonDecode(response.body);
       SourcesResponse sourcesResponse =SourcesResponse.fromJson(response.body);
       if(response.statusCode >= 200 && response.statusCode <300 &&
           sourcesResponse.sources?.isNotEmpty == true ){
         return sourcesResponse.sources!;
       }
       throw Exception("${sourcesResponse.message}");
     }catch(e){
       rethrow;
     }
     }


  static getArticles(){

  }

}