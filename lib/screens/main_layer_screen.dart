import 'package:flutter/material.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/articles/views/category_details.dart';
import 'package:news_app/pages/views/category_view.dart';
import 'package:news_app/pages/views/drawer_view.dart';
import 'package:news_app/providers/category_provider.dart';

import 'package:provider/provider.dart';

class MainLayerScreen extends StatelessWidget {
  const MainLayerScreen({super.key});
  static String routName = '/mainLayerScreen';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => categoryProvider()),
        ChangeNotifierProvider(create: (context) => ArticlesProvieder()),
      ],

      child: Consumer<categoryProvider>(
        builder: (BuildContext context, categoryProvider value, Widget? child) {
          return Scaffold(
            drawer: Drawer(backgroundColor: Colors.black, child: DrawerView()),
            appBar: AppBar(
              title: Text(
                value.selectedCategory != null
                    ? value.selectedCategory!.name
                    : 'Home',
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: value.selectedCategory != null
                ? CategoryDetails()
                : CategoryListView(),
          );
        },
      ),
    );
  }
}
