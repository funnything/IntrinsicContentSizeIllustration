//
//  AppDelegate.swift
//  IntrinsicContentSizeIllustration
//
//  Created by Yosaku Toyama on 2018/11/19.
//  Copyright © 2018年 DeNA. All rights reserved.
//

import Then
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds).then {
            $0.backgroundColor = .white
            $0.rootViewController = ViewController()
            $0.makeKeyAndVisible()
        }
        return true
    }
}
