//
//  InfraModule.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol InfraModule {

    @objc optional func applicationDidFinishLaunching(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
    
    @objc optional func applicationDidAgreeToPrivacyAgreement(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?)

    @objc optional func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool
    
    @objc optional func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    
    @objc optional func applicationDidBecomeActive(_ application: UIApplication)
    
    @objc optional func applicationWillResignActive(_ application: UIApplication)
    
    @objc optional func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
    
    @objc optional func applicationDidReceiveMemoryWarning(_ application: UIApplication)
    
    @objc optional func applicationWillTerminate(_ application: UIApplication)
    
    @objc optional func applicationSignificantTimeChange(_ application: UIApplication)
    
    @objc optional func application(_ application: UIApplication, willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation, duration: TimeInterval)
    
    @objc optional func application(_ application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation)
    
    @objc optional func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect)
    
    @objc optional func application(_ application: UIApplication, didChangeStatusBarFrame oldStatusBarFrame: CGRect)
    
    @objc optional func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)

    @objc optional func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)

    @objc optional func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    
    @objc optional func application(_ application: UIApplication, willPresent notification: UNNotification) -> UNNotificationPresentationOptions
    
    @objc optional func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)

    @objc optional func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void)

    @objc optional func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void)
    
    @objc optional func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Void)
    
    @objc optional func applicationShouldRequestHealthAuthorization(_ application: UIApplication)

    @objc optional func applicationDidEnterBackground(_ application: UIApplication)
    
    @objc optional func applicationWillEnterForeground(_ application: UIApplication)
    
    @objc optional func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication)
    
    @objc optional func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication)
    
    @objc optional func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    
    @objc optional func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool
    
    @objc optional func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController?
    
    @objc optional func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool
    
    @objc optional func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder)
    
    @objc optional func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder)
    
    @objc optional func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool
    
    @objc optional func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool

    @objc optional func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error)
    
    @objc optional func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity)
    
    
}
