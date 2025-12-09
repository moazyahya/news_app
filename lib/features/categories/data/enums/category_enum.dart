import 'package:flutter/widgets.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/gen/assets.gen.dart';

enum CategoryEnum {
  general,
  busniess,
  sports,
  technology,
  science,
  health,
  entertainment;

  String getImagePath() {
    switch (this) {
      case CategoryEnum.general:
        return Assets.images.generalCard.path;
      case CategoryEnum.busniess:
        return Assets.images.businessCard.path;
      case CategoryEnum.sports:
        return Assets.images.sportsCard.path;
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

  String getTranslatedName(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    switch (this) {
      case CategoryEnum.general:
        return tr.general;
      case CategoryEnum.busniess:
        return tr.busniess;
      case CategoryEnum.sports:
        return tr.sports;
      case CategoryEnum.technology:
        return tr.technology;
      case CategoryEnum.science:
        return tr.science;
      case CategoryEnum.health:
        return tr.health;
      case CategoryEnum.entertainment:
        return tr.entertainment;
    }
  }
}
