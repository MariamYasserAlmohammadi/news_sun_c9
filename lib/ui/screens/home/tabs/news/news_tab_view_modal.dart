import 'package:flutter/material.dart';
import 'package:news_sun_c9/data/api/api_manager.dart';
import '../../../../../data/modal/SourcesResponse.dart';

class NewsTabViewModal extends ChangeNotifier{
  List<Source> sources=[];
  bool isLoading = false ;
  String? errorText;
  void getSources(String categoryId)async{
    isLoading =true;
    notifyListeners();
    try {
      sources = await ApiManager.getSources(categoryId);
      isLoading =false;
      notifyListeners();
    }catch(error){
      isLoading =false;
      errorText =error.toString();
      notifyListeners();
    }
  }
}