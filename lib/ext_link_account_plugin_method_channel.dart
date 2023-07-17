import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ext_link_account_plugin_platform_interface.dart';

/// An implementation of [ExtLinkAccountPluginPlatform] that uses method channels.
class MethodChannelExtLinkAccountPlugin extends ExtLinkAccountPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ext_link_account_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> canMakePayments() async {
    try {
      return await methodChannel.invokeMethod('canMakePayments');
    } on PlatformException catch (e) {
      print("Failed to call canMakePayments: ${e.message}");
    }
    return null;
  }

  @override
  Future<bool?> canOpenExternalLinkAccount() async {
    try {
      return await methodChannel.invokeMethod('canOpenExternalLinkAccount');
    } on PlatformException catch (e) {
      print("Failed to call canOpenExternalLinkAccount: ${e.message}");
    }
    return null;
  }

  @override
  Future<void> externalLinkOpen() async {
    try {
      await methodChannel.invokeMethod('externalLinkOpen');
    } on PlatformException catch (e) {
      print("Failed to open external link: ${e.message}");
    }
  }
}
