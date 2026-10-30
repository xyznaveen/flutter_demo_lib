import 'package:flutter/services.dart';

/// A minimal Android and iOS plugin used to test the pub.dev release flow.
class FlutterDemoLib {
  /// Creates a plugin instance.
  const FlutterDemoLib();

  static const MethodChannel _channel = MethodChannel('flutter_demo_lib');

  /// Returns the host platform and version, for example `Android 15`.
  Future<String> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version ?? 'unknown';
  }

  /// Returns a greeting built by the native side.
  Future<String> greet(String name) async {
    final greeting = await _channel.invokeMethod<String>('greet', {
      'name': name,
    });
    return greeting ?? 'Hello, $name';
  }
}
