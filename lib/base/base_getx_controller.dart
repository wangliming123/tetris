import 'dart:async';

import 'package:get/get.dart';
import '../utils/event_bus_utils.dart';

abstract class BaseGetXController extends GetxController {
  finish() {
    Get.back();
  }

  @override
  void onInit() {
    initData();
    initEvent();
    super.onInit();
  }

  void initData() {}

  void initEvent() {}

  /// 刷新页面数据
  void refreshData() {}

  final _subscriptionList = <StreamSubscription>[];

  void addEvent<T>(void Function(T event)? onData) {
    var subscription = EventBusUtils.getBus().on<T>().listen((event) {
      onData?.call(event);
    });
    _subscriptionList.add(subscription);
  }

  @override
  InternalFinalCallback<void> get onDelete {
    for (var subscription in _subscriptionList) {
      subscription.cancel();
    }
    return super.onDelete;
  }

}
