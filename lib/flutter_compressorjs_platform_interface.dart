import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_compressorjs_method_channel.dart';

abstract class FlutterCompressorjsPlatform extends PlatformInterface {
  /// Constructs a FlutterCompressorjsPlatform.
  FlutterCompressorjsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCompressorjsPlatform _instance = MethodChannelFlutterCompressorjs();

  /// The default instance of [FlutterCompressorjsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterCompressorjs].
  static FlutterCompressorjsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCompressorjsPlatform] when
  /// they register themselves.
  static set instance(FlutterCompressorjsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
