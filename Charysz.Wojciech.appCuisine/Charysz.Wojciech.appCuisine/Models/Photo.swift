//
//  Photo.swift
//  Charysz.Wojciech.appCuisine
//
//  Created by Wojciech Charysz on 21.01.17.
//  Copyright © 2017 Wojciech Charysz. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo: Mappable {
    
    var earth_date: Date?
    var cameraFullName: String?
    var img_src: URL?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        earth_date <- (map["earth_date"], EarthDateTransform())
        cameraFullName <- map["camera.full_name"]
        img_src <- (map["img_src"], URLTransform())
    }
}
