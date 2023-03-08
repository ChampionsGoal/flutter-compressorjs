import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_compressorjs/flutter_compressorjs_platform_interface.dart';
import 'package:flutter_compressorjs/flutter_compressorjs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCompressorjsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterCompressorjsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCompressorjsPlatform initialPlatform =
      FlutterCompressorjsPlatform.instance;

  test('$MethodChannelFlutterCompressorjs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCompressorjs>());
  });

  test('getPlatformVersion', () async {
    // FlutterCompressorJS flutterCompressorjsPlugin = FlutterCompressorJS();
    // MockFlutterCompressorjsPlatform fakePlatform =
    //     MockFlutterCompressorjsPlatform();
    // FlutterCompressorjsPlatform.instance = fakePlatform;

    // expect(await flutterCompressorjsPlugin.getPlatformVersion(), '42');
  });
}
