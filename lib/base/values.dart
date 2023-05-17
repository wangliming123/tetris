import 'package:flutter/material.dart';

class SimpleTextStyle extends TextStyle {
  SimpleTextStyle(
      {double fontSize = 16,
      Color? color = Colors.black,
      FontWeight fontWeight = FontWeight.normal,
      double fontHeightScale = 1.1})
      : super(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            height: fontHeightScale,
            decoration: TextDecoration.none);
}

class WidthRes {
  WidthRes._internal();

  static const screenBorderWidth = 3.0;
}

class ColorRes {
  ColorRes._internal();

  // 0%  00
  // 10% 1a
  // 20% 33
  // 30% 4d
  // 40% 66
  // 50% 80
  // 60% 99
  // 70% b3
  // 80% cc
  // 90% e6
  // 100% ff

  static const black40 = Color(0x66000000);
  static const black20 = Color(0x33000000);
  static const fff = Color(0xffffffff);
  static const Color white50 = Color(0x80FFFFFF);
  static const Color white20 = Color(0x33FFFFFF);


  static const backgroundColor = Color(0xffefcc19);
  static const screenBackground = Color(0xff9ead86);
}

class StringRes {
  StringRes._internal();

  static const doubleClickExitStr = "再按一次退出";
}

class FontRes {
  FontRes._internal();

  static const dinBold = "DinBold";
}

class DecorationRes {
  DecorationRes._internal();

  static final normalInputDecoration = BoxDecoration(
    border: Border.all(color: Colors.black, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );

  static const commonBtnDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.lightBlue,
  );

  static const chatSendDecoration = BoxDecoration(
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );
  static const chatReceiveDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );


  static final redDotDecoration = BoxDecoration(
    color: const Color(0xFFFF445B),
    border: Border.all(color: Colors.white, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const roomRedDotDecoration = BoxDecoration(
    color: Color(0xFFFF445B),
    borderRadius: BorderRadius.all(Radius.circular(13)),
  );

  static final onlineDotDecoration = BoxDecoration(
      color: const Color(0xFF52E366),
      border: Border.all(color: Colors.white, width: 1),
      // borderRadius: BorderRadius.all(Radius.circular(50)),
      shape: BoxShape.circle);

  static const white12Radius = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12)));

  static const white10Radius26 = BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.all(Radius.circular(26)));

  static final black20Radius8 = BoxDecoration(
      color: ColorRes.black20,
      borderRadius: BorderRadius.all(Radius.circular(8)));

  static BoxDecoration getImageDecoration(String image) {
    return BoxDecoration(
      image: DecorationImage(image: AssetImage(image)),
    );
  }

  static final f1f1f1Radius8 = BoxDecoration(
      color: const Color(0xFFF1F1F1),
      borderRadius: BorderRadius.all(Radius.circular(8)));

  static const roomCommonBg = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xff3942c4), Color(0xff240843)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
  );

  static final commonBgRadius7 = BoxDecoration(
    gradient:
        const LinearGradient(colors: [Color(0xff00b7fc), Color(0xff45d6ff)]),
    borderRadius: BorderRadius.circular(7),
  );

  static final roomBottomDialog = BoxDecoration(
    gradient: const LinearGradient(
        colors: [Color(0xff262054), Color(0xff1b1835)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
    // color: const Color(0x99171430),
    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
  );

  static BoxDecoration getColorRadiusDecoration(Color color, double radius) {
    return BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static BoxDecoration getGradientRadiusDecoration(
      List<Color> colors, double radius,
      {BoxBorder? border,
      Alignment begin = Alignment.centerLeft,
      Alignment end = Alignment.centerRight}) {
    return BoxDecoration(
        border: border,
        gradient: LinearGradient(colors: colors, begin: begin, end: end),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
