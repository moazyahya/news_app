import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/data/search_ai_services.dart';
import 'package:news_app/features/articles/viewModel/cubit/search_cubit/search_cubit.dart';
import 'package:news_app/features/articles/viewModel/cubit/search_cubit/search_state.dart';
import 'package:news_app/features/articles/views/widgets/news_card_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String routeName = '/SearchView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchApiServices()),
      child: searchViewContant(),
    );
  }
}

class searchViewContant extends StatefulWidget {
  const searchViewContant({super.key});

  @override
  State<searchViewContant> createState() => _searchViewContantState();
}

class _searchViewContantState extends State<searchViewContant> {
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<SearchCubit>().searchArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Cubit = context.read<SearchCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 59,
                width: double.infinity,
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  cursorHeight: 30,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  controller: Cubit.SearchController,
                  onSubmitted: (value) => Cubit.searchArticles(),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Cubit.SearchController.clear();
                        Cubit.reset();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    hintText: 'Search for articls',
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is loadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    } else if (state is emptyState) {
                      return Center(
                        child: Text('No Result Found For ${state.message}'),
                      );
                    } else if (state is errorState) {
                      return Center(child: Text(' ${state.error}'));
                    } else if (state is SuccessState) {
                      return ListView.separated(
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return NewsCardWidget(
                            articales: state.articles[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: state.articles.length,
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
