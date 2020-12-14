//
//  CDRecipe+CoreDataProperties.swift
//  Revision01
//
//  Created by Derek Qua on 11/12/20.
//
//

import Foundation
import CoreData


extension CDRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDRecipe> {
        return NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
    }

    @NSManaged public var name: String?
    @NSManaged public var preparationTime: Int16
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension CDRecipe {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: CDIngredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: CDIngredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension CDRecipe : Identifiable {

}
