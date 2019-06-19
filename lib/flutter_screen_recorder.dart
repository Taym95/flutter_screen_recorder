import 'dart:async';

import 'package:flutter/services.dart';

class FlutterScreenRecorder {
  static const MethodChannel _channel =
      const MethodChannel('flutter_screen_recorder');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
