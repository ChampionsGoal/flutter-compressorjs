import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_compressorjs_platform_interface.dart';

/// An implementation of [FlutterCompressorjsPlatform] that uses method channels.
class MethodChannelFlutterCompressorjs extends FlutterCompressorjsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_compressorjs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
