import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screen_recorder/flutter_screen_recorder.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_screen_recorder');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterScreenRecorder.platformVersion, '42');
  });
}
