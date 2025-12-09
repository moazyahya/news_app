import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/categories/data/enums/category_enum.dart';
import 'package:news_app/features/categories/views/widgets/category_card_widget.dart';
import 'package:news_app/l10n/app_localizations.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.hello,
            style: context.getTheme.textTheme.titleMedium,
          ),

          ...List.generate(
            CategoryEnum.values.length,
            (index) => CategoryCardWidget(
              categoryEnum: CategoryEnum.values[index],
              isRight: (index % 2 == 0),
            ),
          ),
        ],
      ),
    );
  }
}
