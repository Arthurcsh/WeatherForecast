//
//  WeatherModule.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import Foundation
import UIKit

public class WeatherModule: InfraModule {
    public static let shared = WeatherModule()
    
    /**
     * WeatherModule Bundle Resource for Weather Component
     */
    static var mBundle: Bundle?
    public static var moduleBundle: Bundle =  {
        if let bundle = WeatherModule.mBundle {
            return bundle
        }
        
        if let bundlePath = Bundle.main.path(forResource: "Weather", ofType: "bundle"), let bundle = Bundle.init(path: bundlePath) {
            WeatherModule.mBundle = bundle
            return bundle
        }else {
            assertionFailure("Could not find Weather bundle")
        }
        return Bundle.init()
    }()
}

/**
 * pragma mark - Extensions
 */
extension WeatherModule {
    // 系统生命周期回调，该方法用来初始化业务无关的内容。
    public func applicationDidFinishLaunching(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        // register Weather router deeplink
//        WeatherLinkRouter.registerDeeplinks()
    }

}
