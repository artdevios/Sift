//
//  AppDelegate.swift
//  Sift
//
//  Created by Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //IQKeyboardManager
//        IQKeyboardManager.shared.enable = true
        
        // Facebook settings
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Google Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "890073598916-6honh1j10uv9di4mi7qe0elf3f5bjisr.apps.googleusercontent.com"
        
        // Present splash
        SplashRouter.presentSplashModule(from: window)
        
        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handledFB = FBSDKApplicationDelegate.sharedInstance()?.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] as? String)
        
        let handledGoogle = GIDSignIn.sharedInstance().handle(url as URL?, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] as? String)
        
        return handledFB ?? handledGoogle
    }


}

