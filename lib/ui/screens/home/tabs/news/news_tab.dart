import 'package:flutter/material.dart';
import 'package:news_sun_c9/data/api/api_manager.dart';
import 'package:news_sun_c9/data/modal/ArticlesResponse.dart';
import 'package:news_sun_c9/data/modal/SourcesResponse.dart';
import 'package:news_sun_c9/ui/screens/home/tabs/news/news_tab_view_modal.dart';
import 'package:news_sun_c9/widgets/error_view.dart';
import 'package:news_sun_c9/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import 'news_list.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;
  NewsTab(this.categoryId);
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;
  NewsTabViewModal viewModal =NewsTabViewModal() ;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      viewModal.getSources(widget.categoryId);
    });
  }
  @override
  Widget build(BuildContext context) {
  //  viewModal =Provider.of(context);
     return ChangeNotifierProvider(
         create: (_)=> viewModal,
         child: Consumer<NewsTabViewModal>(
           builder: (context,viewModel,_){
             Widget currentView;
             if (viewModal.isLoading){
               currentView =const LoadingWidget();
             }else if(viewModal.sources.isNotEmpty){
               currentView =buildTabs(viewModal.sources);
             }else{
               currentView =ErrorView(message: viewModal.errorText??"");
             }
             return currentView;
           },
         ),
         ) ;
     
      // FutureBuilder(
      //   future: ApiManager.getSources(widget.categoryId),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return buildTabs(snapshot.data!);
      //     } else if (snapshot.hasError) {
      //       return ErrorView(message: snapshot.error.toString());
      //     } else {
      //       return const LoadingWidget();
      //     }
      //   });
  }


  Widget buildTabWidget(String name, bool isSelected) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.blue, width: 2)),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 16, color: isSelected ? Colors.white : Colors.blue),
      ));
// Tab Bar
  Widget buildTabs(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 4,),
            TabBar(
                onTap: (index) {
                  currentTabIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: sources
                    .map((source) => buildTabWidget(source.name ?? "",
                        currentTabIndex == sources.indexOf(source)))
                    .toList()),
            const SizedBox(height: 4,),
            Expanded(
              child: TabBarView(
                  children: sources
                      .map((source) => NewsList(source.id!))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}

