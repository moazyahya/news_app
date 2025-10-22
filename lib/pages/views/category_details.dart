import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/widgets/news_card_widget.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Column(
        children: [
          TabBar(
            labelColor: context.getTheme.colorScheme.secondary,
            dividerColor: Colors.transparent,
            indicatorColor: context.getTheme.colorScheme.secondary,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),
            tabs: [
              Tab(text: 'first'),
              Tab(text: 'sec'),
              Tab(text: 'first'),
              Tab(text: 'sec'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return NewsCardWidget();
                  },
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return NewsCardWidget();
                  },
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return NewsCardWidget();
                  },
                  itemCount: 5,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return NewsCardWidget();
                  },
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return ListView.builder(
    //   padding: EdgeInsets.all(16),
    //   itemBuilder: (context, index) {
    //     return NewsCardWidget();
    //   },
    //   itemCount: 5,
    // );
  }
}
