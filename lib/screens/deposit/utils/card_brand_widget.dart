import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets/app_assets.dart';
import '../validations/validations.dart';

class CardBrand {
  static Widget? handleShowIconBrand(CardType? cardType) {
    String img = '';
    Widget? widget;

    switch (cardType) {
      case CardType.Master:
        img = AppAssets.iconMastercard;
        break;
      case CardType.Visa:
        img = AppAssets.iconVisa;
        break;
      case CardType.AmericanExpress:
        img = AppAssets.iconAmericanExp;
        break;
      case CardType.Discover:
        img = AppAssets.iconDiscover;
        break;
      case CardType.Others:
        img = AppAssets.iconCardOther;
        break;
      case CardType.Invalid:
        img = AppAssets.iconCardOther;
        break;
      default:
        break;
    }

    if (img.isNotEmpty) {
      widget = Container(
        alignment: Alignment.center,
        width: 40,
        child: SvgPicture.asset(
          img,
          width: 40,
          height: 28,
        ),
      );
    }
    return widget;
  }
}
