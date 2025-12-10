import 'package:news_app/features/articles/data/models/news_list_model.dart';

abstract class SearchState {}

class InitState extends SearchState {}

class loadingState extends SearchState {}

class SuccessState extends SearchState {
  final List<Articles> articles;
  SuccessState(this.articles);
}

class errorState extends SearchState {
  final String error;
  errorState(this.error);
}

class emptyState extends SearchState {
  final String message;
  emptyState(this.message);
}
