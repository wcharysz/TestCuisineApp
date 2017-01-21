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
    static let locale = Locale(identifier: "en_US_POSIX")
 
    public init() {
        let formatter = DateFormatter()
        formatter.locale = EarthDateTransform.locale
        formatter.dateFormat = EarthDateTransform.dateFormat
        
        super.init(dateFormatter: formatter)
    }
}
