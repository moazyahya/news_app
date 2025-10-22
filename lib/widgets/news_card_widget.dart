import 'package:flutter/material.dart';
import 'package:news_app/common/exetentions/theme_exetention.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPpAh63HncAuJOC6TxWkGLYpS0WwNXswz9MA&s',
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'data',
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
                  'data',
                  style: TextStyle(
                    color: Color(0xffA0A0A0),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                'data',
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
    );
  }
}
