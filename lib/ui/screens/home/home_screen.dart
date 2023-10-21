import 'package:flutter/material.dart';
import 'package:news_sun_c9/data/api/api_manager.dart';
import 'package:news_sun_c9/data/modal/SourcesResponse.dart';
import 'package:news_sun_c9/data/modal/category_dm.dart';
import 'package:news_sun_c9/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_sun_c9/ui/screens/home/tabs/news/news_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen" ;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab ;
  late final CategoriesTab categoriesTab;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesTab =CategoriesTab(onCategoryClick);
    currentTab =categoriesTab;
  }
  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop:(){
        if(currentTab is! CategoriesTab){
          currentTab ==CategoriesTab(onCategoryClick);
          setState(() {

          });
          return Future.value(false);
        }else{
          return Future.value(true);
        }

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          elevation: 0,
          actions: [],
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(22),bottomLeft: Radius.circular(22) )
          ),
        ),
        body:currentTab ,
        drawer: buildDrawer()
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM){
    currentTab =NewsTab(categoryDM.id);
    setState(() {

    });
  }
  Widget buildDrawer(){
    return Container(

    );
  }
}
