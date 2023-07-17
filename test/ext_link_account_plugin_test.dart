import 'package:flutter_test/flutter_test.dart';
import 'package:ext_link_account_plugin/ext_link_account_plugin.dart';
import 'package:ext_link_account_plugin/ext_link_account_plugin_platform_interface.dart';
import 'package:ext_link_account_plugin/ext_link_account_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExtLinkAccountPluginPlatform
    with MockPlatformInterfaceMixin
    implements ExtLinkAccountPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> externalLinkOpen() async {
    Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Future<bool?> canMakePayments() async {
    return Future.value(true);
  }

  @override
  Future<bool?> canOpenExternalLinkAccount() {
    return Future.value(true);
  }
}

void main() {
  final ExtLinkAccountPluginPlatform initialPlatform = ExtLinkAccountPluginPlatform.instance;

  test('$MethodChannelExtLinkAccountPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExtLinkAccountPlugin>());
  });

  test('getPlatformVersion', () async {
    ExtLinkAccountPlugin extLinkAccountPlugin = ExtLinkAccountPlugin();
    MockExtLinkAccountPluginPlatform fakePlatform = MockExtLinkAccountPluginPlatform();
    ExtLinkAccountPluginPlatform.instance = fakePlatform;

    expect(await extLinkAccountPlugin.getPlatformVersion(), '42');
  });
}
