import 'package:catapp/presentation/detail_item/detail_item_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/home/home_screen.dart';
import '../presentation/splash/splash_screen.dart';

class MainRoutes {
  static const String splash = "/splash";
  static const String home = "/home";
  static const String detailItem = "/detail";
}

class MainPages {
  static final pages = [
    GetPage(
      name: MainRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: MainRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: MainRoutes.detailItem,
      page: () => DetailItemScreen(),
    ),
  ];
}
