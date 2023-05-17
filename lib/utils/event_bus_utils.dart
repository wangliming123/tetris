
import 'package:event_bus/event_bus.dart';

class EventBusUtils {
  EventBusUtils._internal();

  static EventBus? _bus;

  static EventBus getBus() {
    _bus ??= EventBus();
    return _bus!;
  }


}