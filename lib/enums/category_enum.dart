import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  sports(name: 'sports'),
  business(name: 'business'),
  general(name: 'general');

  final String name;

  const CategoryEnum({required this.name});

  String getImagePath() {
    switch (this) {
      case CategoryEnum.sports:
        return Assets.images.sportsCard.path;
      case CategoryEnum.business:
        return Assets.images.businessCard.path;
      case CategoryEnum.general:
        return Assets.images.generalCard.path;
    }
  }
}
