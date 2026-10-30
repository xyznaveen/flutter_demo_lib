import Flutter
import UIKit

public class FlutterDemoLibPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_demo_lib_naveen", binaryMessenger: registrar.messenger())
    registrar.addMethodCallDelegate(FlutterDemoLibPlugin(), channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "greet":
      let name = (call.arguments as? [String: Any])?["name"] as? String ?? "world"
      result("Hello, \(name) from iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
