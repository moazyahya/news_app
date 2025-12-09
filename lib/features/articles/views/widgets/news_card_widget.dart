import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/articles/data/models/news_list_model.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.articales});
  final Articles articales;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.getTheme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(articales.urlToImage ?? ""),
                    ),
                    Text(
                      articales.title ?? '',
                      style: TextStyle(
                        color: context.getTheme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      articales.description ?? '',
                      style: TextStyle(
                        color: context.getTheme.colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              context.getTheme.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.viewFullArticel,
                          style: TextStyle(
                            color: context.getTheme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: context.getTheme.colorScheme.secondary),
          borderRadius: BorderRadius.circular(16),
          color: context.getTheme.scaffoldBackgroundColor,
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: articales.urlToImage ?? '',
                errorWidget: (context, url, error) =>
                    Icon(Icons.broken_image_outlined),

                placeholder: (context, url) => Container(
                  alignment: Alignment(0, 0),
                  height: 100,
                  child: CircularProgressIndicator(
                    color: context.getTheme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
            Text(
              articales.title ?? '',
              style: TextStyle(
                color: context.getTheme.colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                Expanded(
                  child: Text(
                    articales.description ?? '',
                    style: TextStyle(
                      color: Color(0xffA0A0A0),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(articales.publishedAt ?? '')),
                  style: TextStyle(
                    color: Color(0xffA0A0A0),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
