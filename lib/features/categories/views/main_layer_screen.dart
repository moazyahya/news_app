import 'package:flutter/material.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/articles/views/category_details.dart';
import 'package:news_app/features/articles/views/search_view.dart';
import 'package:news_app/features/categories/views/views/category_view.dart';
import 'package:news_app/features/categories/views/views/drawer_view.dart';
import 'package:news_app/features/categories/viewModel/category_provider.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MainLayerScreen extends StatelessWidget {
  const MainLayerScreen({super.key});
  static String routName = '/mainLayerScreen';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ArticlesProvider()),
      ],
      child: Builder(
        builder: (context) {
          final categoryProvider = context.watch<CategoryProvider>();

          return Scaffold(
            drawer: const Drawer(
              backgroundColor: Colors.black,
              child: DrawerView(),
            ),
            appBar: AppBar(
              title: Text(
                categoryProvider.selectedCategory != null
                    ? categoryProvider.selectedCategory!.getTranslatedName(
                        context,
                      )
                    : AppLocalizations.of(context)!.home,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SearchView.routeName);
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: const _MainBody(),
          );
        },
      ),
    );
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody();

  @override
  Widget build(BuildContext context) {
    final category = context.watch<CategoryProvider>().selectedCategory;

    if (category == null) {
      return const CategoryListView();
    }

    return const CategoryDetails();
  }
}
