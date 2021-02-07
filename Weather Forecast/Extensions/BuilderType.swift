//
//  BuilderType.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import UIKit

protocol BuilderType {
    associatedtype builder
    
    func build() -> builder
}
