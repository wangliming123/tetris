import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/values.dart';
import '../game/Screen.dart';
import 'main_controller.dart';

class MainPage extends StatelessWidget {
  final controller = Get.find<MainController>();
  final state = Get.find<MainController>().state;

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PagePortrait(),
    );
  }
}


class PagePortrait extends StatelessWidget {
  const PagePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.8;

    return SizedBox.expand(
      child: Container(
        color: ColorRes.backgroundColor,
        padding: MediaQuery.of(context).padding,
        child: Column(

          children: [
            const Spacer(),
            _ScreenDecoration(child: Screen(width: screenW)),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }

}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Color(0xFF987f0f), width: WidthRes.screenBorderWidth),
          left: BorderSide(
              color: Color(0xFF987f0f), width: WidthRes.screenBorderWidth),
          right: BorderSide(
              color: Color(0xFFfae36c), width: WidthRes.screenBorderWidth),
          bottom: BorderSide(
              color: Color(0xFFfae36c), width: WidthRes.screenBorderWidth),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: ColorRes.backgroundColor,
          child: child,
        ),
      ),
    );
  }

}
