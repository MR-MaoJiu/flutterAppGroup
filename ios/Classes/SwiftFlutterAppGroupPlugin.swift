import Flutter
import UIKit

public class SwiftFlutterAppGroupPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_app_group", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAppGroupPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let arg=call.arguments as? Dictionary<String,Any>
           print(arg)
           var UserDefult = UserDefaults.init(suiteName: "group.we.record")
         
           switch(call.method)
           {
           case "setAppGroup":
               UserDefult = UserDefaults.init(suiteName: arg?["appGroup"] as?String)
               break;
           case "setBool":
               UserDefult!.set( arg?["value"] as!Bool, forKey: arg?["key"] as!String)
               break;
           case "setInt":
               UserDefult!.set( arg?["value"] as!Int, forKey: arg?["key"] as!String)
               break;
           case "setDouble":
               UserDefult!.set( arg?["value"] as!Double, forKey: arg?["key"] as!String)
               break;
           case "setString":
               UserDefult!.set( arg?["value"] as!String, forKey: arg?["key"] as!String)
               break;
           case "setMap":
               UserDefult!.set( arg?["value"] as!Dictionary<String,Any>, forKey: arg?["key"] as!String)
               break;
           case "get":
               let res =  UserDefult?.value(forKey: arg?["key"] as!String)
               result(res)
               break;
           case "remove":
               UserDefult?.removeObject(forKey: arg?["key"] as!String)
               break;
           default:
               break;
           }
  }
}
