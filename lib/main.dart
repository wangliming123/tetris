import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:tetris/utils/log_utils.dart';
import 'package:tetris/utils/sp_utils.dart';

import 'base/route_const.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: null,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        )
    );
  }
  SpUtils.ins().initPrefs();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }

}

class _AppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppPage();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed: //应用程序可见，app进入前台
        LogUtils.log("app进入前台");

        break;
      case AppLifecycleState.paused: //应用程序不可见，app进入后台
        LogUtils.log("app进入后台");

        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class AppPage extends StatelessWidget {
  const AppPage({super.key});


  @override
  Widget build(BuildContext context) {
    return getPlatformApp();
  }


  Widget getPlatformApp() {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeftWithFade,
      navigatorKey: navigatorKey,
      initialRoute: RouteConst.mainPage,
      getPages: RouteConst.routePages,
    );
  }
}
