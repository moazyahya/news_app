import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/models/news_list_model.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/network/api_services.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/widgets/news_card_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    categoryProvider provider = Provider.of<categoryProvider>(context);

    return FutureBuilder<SourcesModel?>(
      future: ApiServices.getSourses(provider.selectedCategory!.name),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: context.getTheme.colorScheme.secondary,
            ),
          );
        } else if (asyncSnapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(asyncSnapshot.error.toString()),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: context.getTheme.colorScheme.secondary,
                  iconColor: context.getTheme.colorScheme.primary,
                ),
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.replay_outlined),
                iconAlignment: IconAlignment.end,
                label: Text(
                  'Reload',
                  style: TextStyle(color: context.getTheme.colorScheme.primary),
                ),
              ),
            ],
          );
        }
        List<Sources> sources = asyncSnapshot.data?.sources ?? [];

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
                padding: EdgeInsets.symmetric(horizontal: 16),
                tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    sources.length,
                    (index) => NewsList(sourceId: sources[index].id!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getNews(widget.sourceId),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Text(asyncSnapshot.error.toString());
        }
        NewsListModel? newsListModel = asyncSnapshot.data! as NewsListModel?;
        List<Articles> articals = newsListModel?.articles ?? [];
        if (articals.isEmpty) {
          return Center(
            child: Text(
              'No Articsls',
              style: TextStyle(color: context.getTheme.colorScheme.secondary),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return NewsCardWidget(articales: articals[index]);
          },
          itemCount: articals.length,
        );
      },
    );
  }
}
