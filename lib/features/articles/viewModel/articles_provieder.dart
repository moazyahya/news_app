import 'package:flutter/material.dart';
import 'package:news_app/common/error/faliure_model.dart';
import 'package:news_app/features/articles/data/api_services.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:news_app/features/articles/data/models/sources_model.dart';

class ArticlesProvider extends ChangeNotifier {
  SourcesModel? sourcesModel;
  bool sourseLoading = false, articleLoading = false;
  FaliureModel? sourcesError, articlesError;
  ArticlesListModel? articles;
  getSourses(String categoryName) async {
    sourcesError = null;
    sourseLoading = true;
    notifyListeners();
    try {
      SourcesModel sourses = await ApiServices.getSourses(categoryName);
      sourcesModel = sourses;
    } on FaliureModel catch (e) {
      sourcesError = e;
    }
    sourseLoading = false;
    notifyListeners();
  }

  getArticles(String sourceId) async {
    articlesError = null;
    articleLoading = true;
    notifyListeners();
    try {
      ArticlesListModel articlesListModel = await ApiServices.getNews(sourceId);
      articles = articlesListModel;
    } on FaliureModel catch (e) {
      articlesError = e;
    }
    articleLoading = false;
    notifyListeners();
  }
}
