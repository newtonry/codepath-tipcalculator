//
//  AppDelegate.swift
//  tipmunk
//
//  Created by Ryan Newton on 1/19/15.
//  Copyright (c) 2015 ___rvkn___. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("TipViewController") as ViewController
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = viewController
        
        // Override point for customization after application launch.
        setDefaultSettingsValues()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        let timeAppEnteredBackground = NSDate()
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(timeAppEnteredBackground, forKey: "timeAppEnteredBackground")
        
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let timeAppEnteredBackground: AnyObject? = defaults.objectForKey("timeAppEnteredBackground")? {
            let timeDelta = NSDate().timeIntervalSinceDate(timeAppEnteredBackground! as NSDate)
            
            // Reset the settings and reload the viewcontroller if the app has been in the background for more than a given number of seconds
            // There must be a more 'correct' way to do this
            if timeDelta > 100 {
                setDefaultSettingsValues()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewControllerWithIdentifier("TipViewController") as ViewController
                self.window?.rootViewController = viewController
            }
        }
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func setDefaultSettingsValues() {
        // This seems like it should be somewhere else
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(15, forKey: "minTip")
        defaults.setInteger(25, forKey: "maxTip")
        defaults.setInteger(18, forKey: "defaultTip")
        defaults.synchronize()
    }
}

