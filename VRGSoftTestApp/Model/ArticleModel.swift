//
//  ArticleModel.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 24.02.2021.
//

import Foundation

struct ResponseModel: Codable {
    var results: [ArticleModel]
}

struct ArticleModel: Codable {
    var url: String?
    var title: String?
    var published_date: String?
}
