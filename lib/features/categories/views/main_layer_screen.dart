import 'package:flutter/material.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/articles/views/category_details.dart';
import 'package:news_app/features/categories/views/views/category_view.dart';
import 'package:news_app/features/categories/views/views/drawer_view.dart';
import 'package:news_app/features/categories/viewModel/category_provider.dart';
import 'package:provider/provider.dart';

class MainLayerScreen extends StatelessWidget {
  const MainLayerScreen({super.key});
  static String routName = '/mainLayerScreen';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ArticlesProvider()),
      ],
      child: Consumer<CategoryProvider>(
        builder: (context, value, child) {
          return Scaffold(
            drawer: const Drawer(
              backgroundColor: Colors.black,
              child: DrawerView(),
            ),
            appBar: AppBar(
              title: Text(
                value.selectedCategory != null
                    ? value.selectedCategory!.name
                    : 'Home',
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
            body: value.selectedCategory != null
                ? const CategoryDetails()
                : const CategoryListView(),
          );
        },
      ),
    );
  }
}
