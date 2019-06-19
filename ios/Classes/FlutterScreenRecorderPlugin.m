#import "FlutterScreenRecorderPlugin.h"
#import "ASScreenRecorder.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation FlutterScreenRecorderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_screen_recorder"
            binaryMessenger:[registrar messenger]];
  FlutterScreenRecorderPlugin* instance = [[FlutterScreenRecorderPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"startRecording" isEqualToString:call.method]) {
    ASScreenRecorder *recorder = [ASScreenRecorder sharedInstance];
    if (!recorder.isRecording) {
      [recorder startRecording];
      NSLog(@"Start recording");
      [self playStartSound];
      result(@true);
    } else {
      result(@false);
    }
  } else if ([@"stopRecording" isEqualToString:call.method]) {
    ASScreenRecorder *recorder = [ASScreenRecorder sharedInstance];
    if (recorder.isRecording) {
      [recorder stopRecordingWithCompletion:^{
        NSLog(@"Finished recording");
        [self playEndSound];
      }];
      result(@true);
    } else {
      result(@false);
    }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)playStartSound
{
    NSURL *url = [NSURL URLWithString:@"/System/Library/Audio/UISounds/begin_record.caf"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (void)playEndSound
{
    NSURL *url = [NSURL URLWithString:@"/System/Library/Audio/UISounds/end_record.caf"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

@end
