import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  sports(name: 'Sports'),
  business(name: 'Business'),
  general(name: 'General'),
  technology(name: 'Technology');

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

      case CategoryEnum.technology:
        return Assets.images.technologyCard.path;
    }
  }
}
