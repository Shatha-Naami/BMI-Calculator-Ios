//
//  AppDelegate.swift
//  BMI Calculator
//
//  Created by Shatha Naami on 15/05/2023.
//

import UIKit
import Flutter
import FlutterPluginRegistrant


@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

    var flutterEngine : FlutterEngine?;

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.flutterEngine = FlutterEngine(name: "io.flutter", project: nil);
        self.flutterEngine?.run(withEntrypoint: nil);
        GeneratedPluginRegistrant.register(with: self.flutterEngine!);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }

}
