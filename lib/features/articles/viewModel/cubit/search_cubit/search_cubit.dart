import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:news_app/features/articles/data/search_ai_services.dart';
import 'package:news_app/features/articles/viewModel/cubit/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchApiServices) : super(InitState());

  final SearchApiServices searchApiServices;

  int _currentPage = 1;
  final int _pageSize = 10;
  bool _hasMore = true;
  bool _isFeatching = false;
  List<Articles> _allArticls = [];
  TextEditingController SearchController = TextEditingController();

  Future<void> searchArticles() async {
    if (!_hasMore || _isFeatching) {
      return;
    }
    _isFeatching = true;
    try {
      final response = await searchApiServices.searchArticles(
        q: SearchController.text,
        page: _currentPage,
        pageSize: _pageSize,
      );
      emit(loadingState());
      if (response.isEmpty) {
        emit(emptyState(SearchController.text));
        _hasMore = false;
      } else {
        _allArticls.addAll(response);
        emit(SuccessState(List.from(_allArticls)));
        _currentPage++;
      }
    } catch (e) {
      emit(errorState(e.toString()));
    }
    _isFeatching = false;
  }

  void reset() {
    emit(InitState());
  }
}
