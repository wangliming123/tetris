import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/main/main_controller.dart';
import '../ui/main/main_page.dart';

class RouteConst {
  RouteConst._internal();

  // static const splashPage = "/splash";
  static const mainPage = "/main";

  static final routePages = [
    // GetPage(name: splashPage, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: mainPage, page: () => MainPage(), binding: MainBinding()),
  ];
}
