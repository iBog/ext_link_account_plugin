import Flutter
import UIKit
import StoreKit

public class ExtLinkAccountPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ext_link_account_plugin", binaryMessenger: registrar.messenger())
    let instance = ExtLinkAccountPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "externalLinkOpen":
        guard #available(iOS 16.0, *) else { return }
            Task {
              let canOpen = await ExternalLinkAccount.canOpen
              let canMakePayments = SKPaymentQueue.canMakePayments()
              if canOpen, canMakePayments {
                try await ExternalLinkAccount.open()
              }
            }
        result(nil)
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      case "canOpenExternalLinkAccount":
        if #available(iOS 16.0, *) {
            Task {
              let canOpen = await ExternalLinkAccount.canOpen
              result(canOpen)
            }
        }
        result(false)
      case "canMakePayments":
        result(SKPaymentQueue.canMakePayments())
      default:
        result(FlutterMethodNotImplemented)
      }
  }
}
