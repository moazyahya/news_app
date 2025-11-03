import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  sports(name: 'Sports'),
  busniess(name: 'Busniess'),
  general(name: 'General'),
  technology(name: 'Technology'),
  science(name: 'Science'),
  health(name: 'Health'),
  entertainment(name: 'Entertainment');

  final String name;

  const CategoryEnum({required this.name});

  String getImagePath() {
    switch (this) {
      case CategoryEnum.sports:
        return Assets.images.sportsCard.path;
      case CategoryEnum.busniess:
        return Assets.images.businessCard.path;
      case CategoryEnum.general:
        return Assets.images.generalCard.path;
      case CategoryEnum.technology:
        return Assets.images.technologyCard.path;
      case CategoryEnum.science:
        return Assets.images.scienceCard.path;
      case CategoryEnum.health:
        return Assets.images.healthCard.path;
      case CategoryEnum.entertainment:
        return Assets.images.entertainmentCard.path;
    }
  }
}
