
import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {

  SpUtils._internal();

  static final SpUtils _instance = SpUtils._internal();

  factory SpUtils.ins() => _instance;

  SharedPreferences? prefs;
  initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  }

  putString(String key, String value) {
    prefs?.setString(key, value);
  }

  getString(String key) {
    return prefs?.getString(key);
  }

  String? getStringAlways(String key) {
    return prefs?.getString(key);
  }

  removeData(String key) {
    return prefs?.remove(key);
  }

  putInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  getInt(String key) {
    return prefs?.getInt(key);
  }

  int? getIntAlways(String key) {
    return prefs?.getInt(key);
  }

  putDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  getDouble(String key) {
    return prefs?.getDouble(key);
  }

  double? getDoubleAlways(String key) {
    return prefs?.getDouble(key);
  }

  putBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  getBool(String key) {
    return prefs?.getBool(key);
  }

  bool? getBoolAlways(String key) {
    return prefs?.getBool(key);
  }





  /// 得到保存数据的方法，我们根据默认值得到保存的数据的具体类型，然后调用相对于的方法获取值
  // int decodeInt(String key, {int defaultValue = 0, MMKV? kv}) {
  //   return (kv ?? defaultMmkv).decodeInt(key, defaultValue: defaultValue);
  // }
  // double decodeDouble(String key, {double defaultValue = 0, MMKV? kv}) {
  //   return (kv ?? defaultMmkv).decodeDouble(key, defaultValue: defaultValue);
  // }
  //
  // bool decodeBool(String key, {bool defaultValue = false, MMKV? kv}) {
  //   return (kv ?? defaultMmkv).decodeBool(key, defaultValue: defaultValue);
  // }
  //
  // String decodeString(String key, {String defaultValue = "", MMKV? kv}) {
  //   return (kv ?? defaultMmkv).decodeString(key) ?? defaultValue;
  // }
  //
  // MMBuffer? decodeBytes(String key, {MMBuffer? defaultValue, MMKV? kv}) {
  //   return (kv ?? defaultMmkv).decodeBytes(key) ?? defaultValue;
  // }
  //
  // /// 移除某个key对
  // void removeKey(String key, {MMKV? kv}) {
  //   (kv ?? defaultMmkv).removeValue(key);
  // }
  // /// 移除某个key对
  // void removeKeys(List<String> keys, {MMKV? kv}) {
  //   (kv ?? defaultMmkv).removeValues(keys);
  // }
  //
  // /// 清除所有key
  // void clearAll({MMKV? kv}) {
  //   (kv ?? defaultMmkv).clearAll();
  // }
}