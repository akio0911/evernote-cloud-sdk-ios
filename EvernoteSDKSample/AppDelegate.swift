//
//  AppDelegate.swift
//  evernote-sdk-ios
//
//  Created by akio0911 on 2016/03/29.
//  Copyright © 2016年 Evernote Corporation. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        // Add Consumer Key and Consumer Secret, but also modify your app's Info.plist according to documentation!
        // Remove these warnings once done with it.
        
        // FIXME: 後で消す
        // Set shared session key information.
        ENSession.setSharedSessionConsumerKey("akio0911-7671", consumerSecret: "6237988142e42cb7", optionalHost: ENSessionHostSandbox)

        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let navController = UINavigationController(rootViewController: MainViewController())
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return ENSession.sharedSession().handleOpenURL(url)
    }
}