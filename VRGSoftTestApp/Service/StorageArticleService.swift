//
//  StorageAnswerService.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 26.02.2021.
//

import Foundation
import CoreData

protocol PersistenceStore {
    func getArticles() -> [ManagedArticle?]
    func saveArticles(article: ArticleModel?)
}

class StorageAnswerService: PersistenceStore {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ArticleWarehouse")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    lazy var backgroundMOC = persistentContainer.newBackgroundContext()
    
    func getArticles() -> [ManagedArticle?] {
        context.automaticallyMergesChangesFromParent = true
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedArticle")
        do {
            guard let fetchedObjects =
                    try context.fetch(fetchRequest) as? [ManagedArticle] else { return [ManagedArticle]() }
            return fetchedObjects 
        } catch {
            print(error.localizedDescription)
            return [ManagedArticle]()
        }
    }
    
    func saveArticles(article: ArticleModel?) {
        guard let entity =
                NSEntityDescription.entity(forEntityName: "ManagedArticle", in: context) else { return }
        guard let taskObject =
                NSManagedObject(entity: entity, insertInto: backgroundMOC) as? ManagedArticle else { return }
        backgroundMOC.performAndWait {
            taskObject.published_date = article?.published_date
            taskObject.title = article?.title
            taskObject.url = article?.url
            do {
                try backgroundMOC.save()
            } catch {
                print(error)
            }
        }
    }
}


