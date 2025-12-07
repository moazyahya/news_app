import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/categories/data/enums/category_enum.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/categories/viewModel/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryEnum,
    required this.isRight,
  });
  final CategoryEnum categoryEnum;
  final bool isRight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CategoryProvider>(
          context,
          listen: false,
        ).setSelectedCategory(categoryEnum);
        context.read<ArticlesProvider>().getSourses(categoryEnum.name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 198.04,
        width: 363,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage(categoryEnum.getImagePath()),
          ),
          color: context.getTheme.colorScheme.secondary,
        ),
        child: Container(
          width: 159,
          height: 54,
          margin: EdgeInsets.only(
            left: isRight ? 178 : 16,
            top: 128,
            right: isRight ? 16 : 178,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(84),
            color: context.getTheme.scaffoldBackgroundColor.withValues(
              alpha: 0.5,
            ),
          ),
          child: isRight
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 16,
                        top: 9,
                        bottom: 9,
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: context.getTheme.colorScheme.secondary,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.getTheme.colorScheme.primary,
                      ),
                      child: Icon(
                        isRight
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                        color: context.getTheme.colorScheme.secondary,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.getTheme.colorScheme.primary,
                      ),
                      child: Icon(
                        isRight
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                        color: context.getTheme.colorScheme.secondary,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                        left: 10,
                        top: 9,
                        bottom: 9,
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: context.getTheme.colorScheme.secondary,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
