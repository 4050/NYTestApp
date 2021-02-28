//
//  NetworkService.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 24.02.2021.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchRequest(urlString: String, completion: @escaping (ResponseModel?) -> Void)  {
        AF.request(urlString, method: .get, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            let decoder = JSONDecoder()
            
            do {
                let objects = try decoder.decode(ResponseModel.self, from: data)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
}

