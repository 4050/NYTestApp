//
//  ArticleStorageModal.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 27.02.2021.
//

import Foundation

class ArticleStorageModel {
    
    private let storageArticle = StorageAnswerService()
    
    func getActicles() -> [ManagedArticle?] {
        let articles = storageArticle.getArticles()
        return articles
    }
    
    func saveArticle(article: ArticleModel) {
        storageArticle.saveArticles(article: article)
        print(article)
    }
    
}

