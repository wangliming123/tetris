
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

class LogUtils {
  LogUtils._internal();

  static debug(Object? object) {
    _printLog(object);
  }

  static log(Object? object) {
    _printLog(object);

  }

  static void _printLog(Object? object) {
    if (kDebugMode) {
      String msg = "$object";
      developer.log(msg);
    }
  }
}