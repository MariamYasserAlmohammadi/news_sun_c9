import 'package:flutter/material.dart';
import 'package:news_sun_c9/data/api/api_manager.dart';
import 'package:news_sun_c9/data/modal/SourcesResponse.dart';
import 'package:news_sun_c9/ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homescreen" ;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: NewsTab() ,
    );
  }
}
