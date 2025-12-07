import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/categories/data/enums/category_enum.dart';
import 'package:news_app/features/categories/views/widgets/category_card_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''Good Morning
Here is Some News For You''', style: context.getTheme.textTheme.titleMedium),

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
