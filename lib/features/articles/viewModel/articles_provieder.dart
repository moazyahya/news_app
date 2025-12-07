import 'package:flutter/material.dart';
import 'package:news_app/features/articles/data/api_services.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:news_app/features/articles/data/models/sources_model.dart';

class ArticlesProvider extends ChangeNotifier {
  SourcesModel? sourcesModel;
  bool sourseLoading = false, articleLoading = false;
  String? sourcesError, articlesError;
  ArticlesListModel? articles;
  getSourses(String categoryName) async {
    sourseLoading = true;
    notifyListeners();
    try {
      SourcesModel sourses = await ApiServices.getSourses(categoryName);
      sourcesModel = sourses;
    } catch (e) {
      sourcesError = e.toString();
    }
    sourseLoading = false;
    notifyListeners();
  }

  getArticles(String sourceId) async {
    articleLoading = true;
    notifyListeners();
    try {
      ArticlesListModel articlesListModel = await ApiServices.getNews(sourceId);
      articles = articlesListModel;
    } catch (e) {
      articlesError = e.toString();
    }
    articleLoading = false;
    notifyListeners();
  }
}
