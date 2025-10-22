import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/widgets/category_card_widget.dart';

class MainLayerScreen extends StatelessWidget {
  const MainLayerScreen({super.key});
  static String routName = '/mainLayerScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('''Good Morning
Here is Some News For You''', style: context.getTheme.textTheme.titleMedium),
            ...CategoryEnum.values.map(
              (e) => CategoryCardWidget(categoryEnum: e),
            ),
          ],
        ),
      ),
    );
  }
}
