import 'package:flutter/material.dart';
import 'package:news_app/gen/assets.gen.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:news_app/widgets/drop_down_button.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

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
            'News App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Provider.of<categoryProvider>(
                    context,
                    listen: false,
                  ).emptyCategory();
                  Navigator.of(context).pop();
                },
                leading: Icon(Icons.home, color: Colors.white),
                title: Text(
                  'Go To Home',
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
                  'Theme',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
