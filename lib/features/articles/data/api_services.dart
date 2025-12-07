import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:news_app/features/articles/data/models/sources_model.dart';
import 'package:news_app/common/network/api_consts.dart';

class ApiServices {
  static Dio dio = Dio(BaseOptions(baseUrl: ApiConsts.baseUrl));

  static Future<SourcesModel> getSourses(String category) async {
    try {
      Response response = await dio.get(
        ApiConsts.soursesEndPoint,
        queryParameters: {'apiKey': ApiConsts.apiKey, 'category': category},
      );
      SourcesModel sourcesModel = SourcesModel.fromJson(response.data);
      if (response.statusCode == 200 && sourcesModel.status == "ok") {
        return sourcesModel;
      } else {
        throw sourcesModel.message ?? "something wrong";
      }
    } on DioException catch (e) {
      throw Text(e.message ?? 'something wrong');
    } catch (e) {
      throw e.toString();
    }
  }

  static getNews(String sourceId) async {
    try {
      Response response = await dio.get(
        ApiConsts.newsEndPoint,
        queryParameters: {'apiKey': ApiConsts.apiKey, 'Sources': sourceId},
      );
      ArticlesListModel newsListModel = ArticlesListModel.fromJson(
        response.data,
      );
      if (response.statusCode == 200 && newsListModel.status == "ok") {
        return newsListModel;
      } else {
        throw newsListModel.message ?? 'somthing wrong';
      }
    } on DioException catch (e) {
      throw e.message ?? 'something wrong';
    } catch (e) {
      throw e.toString();
    }
  }
}
