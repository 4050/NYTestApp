//
//  MostSharedModel.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 27.02.2021.
//

import Foundation

class MostSharedModel {
    
    private let networkService = NetworkService()
    
    func requestData(completion: @escaping (ResponseModel?) -> Void) {
        networkService.fetchRequest(urlString: L10n.mostSharedURL) { (respons) in
            completion(respons)
        }
    }
}

