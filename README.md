# flutter_screen_recorder

A flutter plugin to record phone screen and generate `.mp4` video, this plugin inspired by [react-native-screen-recorder](https://github.com/ycswaves/react-native-screen-recorder) 

## Accomplishement
The screen recording feature is able to run on both platforms but the implementation is quite different on each platform.

### iOS
[ASScreenRecorder](https://github.com/alskipp/ASScreenRecorder) is included as an external library to handle the screen recording function. All I need 

The output video will be saved into iOS camera roll.

_* In this app, it's naively assumed that the recording is always the latest video in the camara roll._

### Android
Work on progress..

### Installation

Add `flutter_screen_recorder` to your `pubspec.yamlfile`.

### Usage

```dart
import 'package:flutter_screen_recorder/flutter_screen_recorder.dart';

// Start screen recording 
final result = await FlutterScreenRecorder.startRecording();
if(result){
    // Start screen recording succeed
}

final result = await FlutterScreenRecorder.stopRecording();
if(result){
    // Stop screen recording succeed
}
```
