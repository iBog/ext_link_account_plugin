import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ext_link_account_plugin/ext_link_account_plugin_method_channel.dart';

void main() {
  MethodChannelExtLinkAccountPlugin platform = MethodChannelExtLinkAccountPlugin();
  const MethodChannel channel = MethodChannel('ext_link_account_plugin');

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
