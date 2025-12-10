import 'package:dio/dio.dart';
import 'package:news_app/common/network/api_consts.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SearchApiServices {
  final Dio dio;
  SearchApiServices()
    : dio =
          Dio(
              BaseOptions(
                baseUrl: ApiConsts.baseUrl,
                receiveTimeout: Duration(seconds: 10),
                connectTimeout: Duration(seconds: 10),
              ),
            )
            ..interceptors.add(
              PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseBody: true,
                error: true,
              ),
            );
  Future<List<Articles>> searchArticles({
    required String q,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await dio.get(
        ApiConsts.searchEndPoint,
        queryParameters: {
          'q': q,
          'language': 'en',
          'apiKey': ApiConsts.apiKey,
          'page': page,
          'pageSize': pageSize,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final newResponce = ArticlesListModel.fromJson(response.data);
        return newResponce.articles ?? [];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Failed To Load Data',
        );
      }
    } on DioException catch (e) {
      if (e.type == DioException.connectionError) {
        throw Exception('Connection Failed');
      } else if (e.type == DioException.receiveTimeout) {
        throw Exception('Connection Failed');
      } else if (e.response?.statusCode == 426) {
        throw Exception('request Limet exceeded');
      }
      rethrow;
    }
  }
}
