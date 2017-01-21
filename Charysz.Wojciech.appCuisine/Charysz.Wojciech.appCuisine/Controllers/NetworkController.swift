//
//  NetworkController.swift
//  Charysz.Wojciech.appCuisine
//
//  Created by Wojciech Charysz on 21.01.17.
//  Copyright © 2017 Wojciech Charysz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkController {
    
    let baseURL = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY")
    
    func downloadNASARoverPhotos(completion:@escaping ([Photo]?) -> Void) {
        guard let baseURL = baseURL else {
            completion(nil)
            return
        }
        
        Alamofire.request(baseURL).responseArray(queue: nil, keyPath: "photos", context: nil) { (response: DataResponse<[Photo]>) in
            completion(response.value)
        }
    }
}
