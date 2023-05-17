import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ColorEx on String {
  Color get color {
    if (startsWith("#") && (length == 7 || length == 9)) {
      String res;
      if (length == 7) {
        res = replaceAll("#", "0xFF");
      } else {
        res = replaceAll("#", "0x");
      }
      return Color(int.parse(res));
    } else {
      return Colors.white;
    }
  }
}

extension WidgetEx on Widget {
  Widget visible(bool visible) {
    return Visibility(
      visible: visible,
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget onTap(void Function() onTap, {void Function()? onLongPress}) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () => {onLongPress?.call()},
      child: this,
    );
  }

  Widget onPress(Function(PointerDownEvent) onPress,
      {Function(PointerUpEvent)? onPressUp}) {
    return Listener(
      onPointerDown: onPress,
      onPointerUp: (event) => {onPressUp?.call(event)},
      child: this,
    );
  }

  Widget margin(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return Container(
      margin:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  ///getX有同名方法，防止冲突，注释掉
  // Widget marginAll(double all) {
  //   return Container(
  //     margin: EdgeInsets.all(all),
  //     child: this,
  //   );
  // }

  Widget padding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  ///getX有同名方法，防止冲突，注释掉
  // Widget paddingAll(double all) {
  //   return Padding(
  //     padding: EdgeInsets.all(all),
  //     child: this,
  //   );
  // }

  Widget position({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  Widget positionFill({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned.fill(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: this,
    );
  }

  Widget willPopScope({WillPopCallback? willPop}) {
    return WillPopScope(
      onWillPop: willPop,
      child: this,
    );
  }

  Widget size({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget centerSize({double? width, double? height}) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: this,
    );
  }

  Widget bgColor({Color? color}) {
    return Container(
      color: color,
    );
  }

  Widget constraint({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth,
          minHeight: minHeight,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        child: this);
  }
}

extension StringEx on String {
  void toast() {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}

extension StringEx2 on String? {
  bool get isNullOrEmpty => (this == null || this!.isEmpty);
}

extension ListExt<T> on List<T>? {
  bool get isNullOrEmpty => (this == null || this!.isEmpty);
}
