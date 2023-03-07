import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_compressorjs/flutter_compressorjs_method_channel.dart';

void main() {
  MethodChannelFlutterCompressorjs platform = MethodChannelFlutterCompressorjs();
  const MethodChannel channel = MethodChannel('flutter_compressorjs');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
