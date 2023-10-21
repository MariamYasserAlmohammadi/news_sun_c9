import 'package:flutter/material.dart';
import 'package:news_sun_c9/widgets/error_view.dart';
import 'package:news_sun_c9/widgets/loading_widget.dart';

import '../../../../../data/api/api_manager.dart';
import '../../../../../data/modal/ArticlesResponse.dart';
import '../../../../../widgets/article_widget.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  NewsList(this.sourceId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceId),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildArticlesListView(snapshot.data!);
          }else if(snapshot.hasError){
            return ErrorView(message: snapshot.error.toString());
          }else {
            return const LoadingWidget();
          }
        });
  }

  Widget buildArticlesListView(List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return   ArticleWidget(article: articles[index]);
        }
    );
  }



}