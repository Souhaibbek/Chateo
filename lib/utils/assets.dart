import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  static const String logoSvg = 'assets/img/logo.svg';
  static const String logo = 'assets/img/logo.png';
  static const String background = 'assets/img/background.png';
  static const String backgroundSvg = 'assets/img/backgroundSvg.svg';
  static const String addIcon = 'assets/img/add_icon.svg';
  static const String chatIcon = 'assets/img/chat_icon.svg';
  static const String contactIcon = 'assets/img/contact_icon.svg';
  static const String userPic = 'assets/img/user.png';
  static const String moreIcon = 'assets/img/more_icon.svg';
  static const String onboarding1 = 'assets/img/onboarding1.svg';
  static const String onboarding2 = 'assets/img/onboarding2.svg';
  static const String onboarding3 = 'assets/img/onboarding3.svg';
  static const String onboarding4 = 'assets/img/onboarding4.svg';

  static void svgPrecacheImage() {
    const cacheSvgImages = [
      /// Specify the all the svg image to cache
      Assets.backgroundSvg,
      Assets.onboarding1,
      Assets.onboarding2,
      Assets.onboarding3,
      Assets.onboarding4,
      Assets.addIcon,
      Assets.chatIcon,
      Assets.contactIcon,
      Assets.moreIcon,
      Assets.userPic,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
