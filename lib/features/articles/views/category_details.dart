import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/articles/views/news_list.dart';
import 'package:news_app/features/articles/data/models/sources_model.dart';
import 'package:news_app/features/categories/viewModel/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final category = context.read<CategoryProvider>().selectedCategory;
      if (category != null) {
        context.read<ArticlesProvider>().getSourses(category.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.sourseLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: context.getTheme.colorScheme.secondary,
            ),
          );
        }

        if (viewModel.sourcesError != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  viewModel.sourcesError!.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.getTheme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: context.getTheme.colorScheme.secondary,
                    iconColor: context.getTheme.colorScheme.primary,
                  ),
                  onPressed: () {
                    final category = context
                        .read<CategoryProvider>()
                        .selectedCategory;
                    if (category != null) {
                      context.read<ArticlesProvider>().getSourses(
                        category.name,
                      );
                    }
                  },
                  icon: const Icon(Icons.replay_outlined),
                  iconAlignment: IconAlignment.end,
                  label: Text(
                    'Reload',
                    style: TextStyle(
                      color: context.getTheme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        List<Sources> sources = viewModel.sourcesModel?.sources ?? [];

        if (sources.isEmpty) {
          return Center(
            child: Text(
              'No sources available',
              style: TextStyle(color: context.getTheme.colorScheme.secondary),
            ),
          );
        }

        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                labelColor: context.getTheme.colorScheme.secondary,
                dividerColor: Colors.transparent,
                indicatorColor: context.getTheme.colorScheme.secondary,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sources
                      .map((source) => NewsList(sourceId: source.id!))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
