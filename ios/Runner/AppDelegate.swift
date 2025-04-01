import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //YMKMapKit.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
   // YMKMapKit.setApiKey("f25a4e11-d261-417d-a17f-e88a79d65b4f") // Your generated API key
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}