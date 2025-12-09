import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';
import 'package:news_app/features/categories/data/enums/category_enum.dart';
import 'package:news_app/features/articles/viewModel/articles_provieder.dart';
import 'package:news_app/features/categories/viewModel/category_provider.dart';
import 'package:news_app/l10n/app_localizations.dart';
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
    final theme = context.getTheme;

    return InkWell(
      onTap: () {
        context.read<CategoryProvider>().setSelectedCategory(categoryEnum);
        context.read<ArticlesProvider>().getSourses(
          categoryEnum.getTranslatedName(context),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 198.04,
        width: double.infinity,
        alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage(categoryEnum.getImagePath()),
            fit: BoxFit.cover,
          ),
          color: theme.colorScheme.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  right: isRight ? 40 : 0,
                  left: isRight ? 0 : 20,
                  top: 25,
                ),

                child: Text(
                  categoryEnum.getTranslatedName(context),
                  textAlign: isRight ? TextAlign.right : TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            Align(
              alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 180,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84),
                  color: theme.scaffoldBackgroundColor.withValues(alpha: 0.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isRight) _circleIcon(theme, isRight),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 16,
                        top: 9,
                        bottom: 9,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.viewAll,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Spacer(),
                    if (isRight) _circleIcon(theme, isRight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(ThemeData theme, bool isRight) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.primary,
      ),
      child: Icon(
        isRight ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
