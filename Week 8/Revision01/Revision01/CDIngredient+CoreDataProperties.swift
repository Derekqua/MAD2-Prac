//
//  CDIngredient+CoreDataProperties.swift
//  Revision01
//
//  Created by Derek Qua on 11/12/20.
//
//

import Foundation
import CoreData


extension CDIngredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDIngredient> {
        return NSFetchRequest<CDIngredient>(entityName: "CDIngredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var recipes: NSSet?

}

// MARK: Generated accessors for recipes
extension CDIngredient {

    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: CDRecipe)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: CDRecipe)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: NSSet)

}

extension CDIngredient : Identifiable {

}
