//
//  AppDelegate.swift
//  DYZB
//
//  Created by 吴世兴 on 2017/7/12.
//  Copyright © 2017年 吴世兴. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 设置导航图标选择时的颜色为 orange
        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }
}

