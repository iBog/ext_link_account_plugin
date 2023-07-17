import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ext_link_account_plugin_method_channel.dart';

abstract class ExtLinkAccountPluginPlatform extends PlatformInterface {
  /// Constructs a ExtLinkAccountPluginPlatform.
  ExtLinkAccountPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExtLinkAccountPluginPlatform _instance = MethodChannelExtLinkAccountPlugin();

  /// The default instance of [ExtLinkAccountPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelExtLinkAccountPlugin].
  static ExtLinkAccountPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExtLinkAccountPluginPlatform] when
  /// they register themselves.
  static set instance(ExtLinkAccountPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> canMakePayments() {
    throw UnimplementedError('canMakePayments() has not been implemented.');
  }

  Future<bool?> canOpenExternalLinkAccount() {
    throw UnimplementedError('canOpenExternalLinkAccount() has not been implemented.');
  }

  Future<void> externalLinkOpen() async {
    throw UnimplementedError('externalLinkOpen() has not been implemented.');
  }
}
