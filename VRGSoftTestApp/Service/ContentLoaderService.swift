//
//  ContentLoader.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 28.02.2021.
//

import Foundation
import Alamofire

class ContentLoaderService {
    
    var pageContent: String?
    
    func getPageContent(url: String, completion: @escaping (String?) -> Void) {
        AF.request(url).responseString { (response) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                completion(response.value)
            }
        }
    }
}


