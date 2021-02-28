//
//  ArticleStorageModal.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 27.02.2021.
//

import Foundation

class ArticleStorageModel {
    
    private let storageArticle = ArticleStorageService()
    private let contentLoaderService = ContentLoaderService()
    
    func getActicles() -> [ManagedArticle?] {
        let articles = storageArticle.getArticles()
        return articles
    }
    
    func saveArticle(article: ArticleModel) {
        storageArticle.saveArticles(article: article)
    }
    
    func getPageContent(url: String, completion: @escaping (String?) -> Void) {
        contentLoaderService.getPageContent(url: url) {(response) in
            completion(response)
        }
    }
}

