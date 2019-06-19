import 'dart:async';

import 'package:flutter/services.dart';

class FlutterScreenRecorder {
  static const MethodChannel _channel =
      const MethodChannel('flutter_screen_recorder');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int> startRecording() async {
    final int result = await _channel.invokeMethod('startRecording');
    return result;
  }

  static Future<int> stopRecording() async {
    final int result = await _channel.invokeMethod('stopRecording');
    print(result);
    return result;
  }
}
