import 'package:flutter/material.dart';
import 'package:news_app/common/providers/app_setting_proviser.dart';
import 'package:news_app/gen/assets.gen.dart';
import 'package:news_app/features/categories/viewModel/category_provider.dart';
import 'package:news_app/features/categories/views/widgets/drop_down_button.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

List<String> languageitems = ['Arabic', 'English'];
String currentlanguageValue = 'English';

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          width: double.infinity,
          height: 166,
          child: Text(
            AppLocalizations.of(context)!.newsApp,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Provider.of<CategoryProvider>(
                    context,
                    listen: false,
                  ).emptyCategory();
                  Navigator.of(context).pop();
                },
                leading: Icon(Icons.home, color: Colors.white),
                title: Text(
                  AppLocalizations.of(context)!.goToHome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: Colors.white, indent: 16, endIndent: 16),

              ListTile(
                leading: Image.asset(Assets.images.themeIcon.path),
                title: Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              DropDownButton<ThemeMode>(
                value: Provider.of<AppSetteingProvider>(
                  context,
                  listen: false,
                ).currentThemeMode,
                onChanged: (ThemeMode? mode) {
                  if (mode != null) {
                    Provider.of<AppSetteingProvider>(
                      context,
                      listen: false,
                    ).getThemeMode(mode);
                    Navigator.of(context).pop();
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(
                      AppLocalizations.of(context)!.dark,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(
                      AppLocalizations.of(context)!.light,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Divider(color: Colors.white, indent: 16, endIndent: 16),

              ListTile(
                leading: Image.asset(Assets.images.languageIcon.path),
                title: Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              DropDownButton(
                items: [
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(
                      AppLocalizations.of(context)!.ar,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      AppLocalizations.of(context)!.en,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                value: Provider.of<AppSetteingProvider>(context).currentLocale,
                onChanged: (value) {
                  if (value != null) {
                    Provider.of<AppSetteingProvider>(
                      context,
                      listen: false,
                    ).getAppLocal(value);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
