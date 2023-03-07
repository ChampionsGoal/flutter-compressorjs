
import 'flutter_compressorjs_platform_interface.dart';

class FlutterCompressorjs {
  Future<String?> getPlatformVersion() {
    return FlutterCompressorjsPlatform.instance.getPlatformVersion();
  }
}
