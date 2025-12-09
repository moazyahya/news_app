import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/articles/views/widgets/news_card_widget.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticlesProvider>().getArticles(widget.sourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.articleLoading || viewModel.articles == null) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel.articlesError != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(viewModel.articlesError!.toString()),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: context.getTheme.colorScheme.secondary,
                  iconColor: context.getTheme.colorScheme.primary,
                ),
                onPressed: () {
                  context.read<ArticlesProvider>().getArticles(widget.sourceId);
                },
                icon: Icon(Icons.replay_outlined),
                iconAlignment: IconAlignment.end,
                label: Text(
                  AppLocalizations.of(context)!.reload,
                  style: TextStyle(color: context.getTheme.colorScheme.primary),
                ),
              ),
            ],
          );
        }
        ArticlesListModel? newsListModel =
            viewModel.articles! as ArticlesListModel?;
        List<Articles> articals = newsListModel?.articles ?? [];
        if (articals.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noArticsls,
              style: TextStyle(color: context.getTheme.colorScheme.secondary),
            ),
          );
        }
        return RefreshIndicator(
          color: Colors.black,
          onRefresh: () async {
            context.read<ArticlesProvider>().getArticles(widget.sourceId);
          },
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return NewsCardWidget(articales: articals[index]);
            },
            itemCount: articals.length,
          ),
        );
      },
    );
  }
}
