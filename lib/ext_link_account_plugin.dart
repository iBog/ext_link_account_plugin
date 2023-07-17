
import 'ext_link_account_plugin_platform_interface.dart';

class ExtLinkAccountPlugin {
  Future<String?> getPlatformVersion() {
    return ExtLinkAccountPluginPlatform.instance.getPlatformVersion();
  }

  Future<bool?> canMakePayments() {
    return ExtLinkAccountPluginPlatform.instance.canMakePayments();
  }

  Future<bool?> canOpenExternalLinkAccount() {
    return ExtLinkAccountPluginPlatform.instance.canOpenExternalLinkAccount();
  }

  Future<void> externalLinkOpen() {
    return ExtLinkAccountPluginPlatform.instance.externalLinkOpen();
  }
}
