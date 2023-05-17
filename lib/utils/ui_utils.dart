import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiUtils {
  UiUtils._internal();

  static Widget text(
    String text,
    double size,
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double fontHeight = 1,
    TextAlign? textAlign = TextAlign.start,
    int? maxlines = 1000,
    String? fontFamily,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.0,
      style: TextStyle(
        fontSize: size,
        color: color,
        decoration: TextDecoration.none,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        height: fontHeight,
      ),
    );
  }

  static Widget textField({
    TextInputType inputType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    Color? textColor,
    Color? hintColor,
    String text = "",
    String? hintText,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    EdgeInsetsGeometry? contentPadding,
    bool isCollapsed = true, //逐步修改为默认传true，代表包裹内容，防止神奇的padding
    Function(String)? onText,
    FocusNode? focusNode,
    double? cursorWidth,
    bool? showCursor,
    bool obscureText = false,
    @required TextEditingController? controller,
    bool enableInteractiveSelection = true, //是否允许使用剪切板
  }) {
    if (text.isNotEmpty && controller?.text.isEmpty == true) {
      controller?.value = TextEditingValue(text: text);
    }
    TextField field = TextField(
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardType: inputType,
      maxLength: maxLength,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      cursorColor: textColor,
      cursorWidth: cursorWidth ?? 1,
      showCursor: showCursor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        border: InputBorder.none,
        counterText: "",
        contentPadding: contentPadding,
        isCollapsed: isCollapsed,
      ),
      onChanged: (value) {
        onText?.call(value);
      },
      maxLines: maxLines,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
    );
    return field;
  }


  static Widget decorationText(
      String text,
      double size,
      Color color, {
        double? width,
        double? height,
        Alignment alignment = Alignment.center,
        Decoration? decoration,
        EdgeInsetsGeometry? padding,
        EdgeInsetsGeometry? margin,
        FontWeight fontWeight = FontWeight.normal,
        double fontHeight = 1,
        TextAlign? textAlign = TextAlign.start,
        int? maxlines = 1000,
        String? fontFamily,
      }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: alignment,
      decoration: decoration,
      child: UiUtils.text(text, size, color),
    );
  }
}
