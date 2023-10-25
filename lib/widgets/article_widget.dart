import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/modal/ArticlesResponse.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
             placeholder: (_,__)=> const Center(child: CircularProgressIndicator()),
              errorWidget: (_,__,___)=> const Icon(Icons.error),
              height: MediaQuery.of(context).size.height * .25,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(article.source?.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
             style: GoogleFonts.inter(fontSize: 11, color: const Color(0xffA3A3A3))
    ),
          const SizedBox(
            height: 2,
          ),
          Text(article.title ?? "" ,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,),
          const SizedBox(
            height: 2,
          ),
          Text(
            article.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: GoogleFonts.inter(fontSize: 11, color: const Color(0xffA3A3A3)
            ),
          ),],
      ),
    );
  }

}
class X{
  late int _x;
  late int y;
  late String product;

  set productName(String newName){
    product = "xx" + newName;
  }
  String get productName{
    return " "+ product;
  }
}