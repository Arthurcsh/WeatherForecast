//
//  String+EX.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import UIKit

extension String {
    func stringDate(withFormat format: String = "yyyy-MM-dd") -> Date {
      let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = format
      guard let date = dateFormatter.date(from: self) else {
        preconditionFailure("check date format failure.")
      }
        
      return date
    }
    
    func stringEEEddMM() -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, d MMM"
        return dateFormatter.string(from: self.stringDate())
    }
    
}
