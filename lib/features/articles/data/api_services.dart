import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/error/faliure_model.dart';
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
        throw BaseError(
          errorMassege: sourcesModel.message ?? 'somthing wrong',
          errorCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw FaliureModel.getNetWorkError(e);
    } catch (e) {
      throw BaseError(errorMassege: e.toString());
    }
  }

  static getNews(String sourceId) async {
    try {
      Response response = await dio.get(
        ApiConsts.newsEndPoint,
        queryParameters: {'apiKey': ApiConsts.apiKey, 'Sources': sourceId},
      );
      ArticlesListModel articlsListModel = ArticlesListModel.fromJson(
        response.data,
      );
      if (response.statusCode == 200 && articlsListModel.status == "ok") {
        return articlsListModel;
      } else {
        throw BaseError(
          errorMassege: articlsListModel.message ?? 'somthing wrong',
          errorCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw FaliureModel.getNetWorkError(e);
    } catch (e) {
      throw BaseError(errorMassege: e.toString());
    }
  }
}
