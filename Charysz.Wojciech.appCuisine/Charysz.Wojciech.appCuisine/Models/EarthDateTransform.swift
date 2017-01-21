//
//  EarthDateTransform.swift
//  Charysz.Wojciech.appCuisine
//
//  Created by Wojciech Charysz on 21.01.17.
//  Copyright © 2017 Wojciech Charysz. All rights reserved.
//

import Foundation
import ObjectMapper

class EarthDateTransform: DateFormatterTransform {
    
    static let dateFormat = "yyyy-MM-dd"
 
    public init() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = EarthDateTransform.dateFormat
        
        super.init(dateFormatter: formatter)
    }
}
