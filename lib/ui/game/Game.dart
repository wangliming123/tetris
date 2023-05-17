

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main/main_controller.dart';

class GameView extends StatelessWidget {
  final Size size;

  GameView({
    Key? key,
    required double width,
  })  : assert(width != 0),
        size = Size(width, width * 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {


    return SizedBox.fromSize(
      size: size,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Stack(
          children: [

          ],
        ),
      ),
    );
  }

}

class GameBriks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final gameState = Get.find<MainController>().gameState;
    return Column(

    );
  }
}