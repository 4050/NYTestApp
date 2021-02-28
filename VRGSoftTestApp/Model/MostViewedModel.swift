//
//  MostViewedModel.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 27.02.2021.
//

import Foundation

class MostViewedModel {
    
    private let networkService = NetworkService()
    
    func requestData(completion: @escaping (ResponseModel?) -> Void) {
        networkService.fetchRequest(urlString: L10n.mostViewedURL) { (respons) in
            completion(respons)
        }
    }
}

