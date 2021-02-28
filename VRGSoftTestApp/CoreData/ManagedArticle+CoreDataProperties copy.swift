//
//  ManagedArticle+CoreDataProperties.swift
//  
//
//  Created by Stanislav on 28.02.2021.
//
//

import Foundation
import CoreData


extension ManagedArticle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedArticle> {
        return NSFetchRequest<ManagedArticle>(entityName: "ManagedArticle")
    }

    @NSManaged public var published_date: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var content: String?

}
