//
//  IngredientController.swift
//  Revision01
//
//  Created by Derek Qua on 11/12/20.
//

import Foundation
import UIKit
import CoreData

class IngredientController{

    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    var item:[CDIngredient] = []
    
    init() {
        //Refering to the container
        appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a context for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    /*func addingredient(name n: String, rec r: CDRecipe){
        let cdIngredient = CDIngredient(context: context)
        
        //adding ingredient to recipe
        cdIngredient.name = n
        cdIngredient.addToRecipes(r)
        
        
        
        do{
            try context.save()
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
    }*/
    func addingredient(name n: String, rec r: Recipe){

        
        //adding ingredient to recipe
        let fetchIngredientRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        fetchIngredientRequest.predicate = NSPredicate(format: "name = %@", r.name)
        
        do{
            
            let cdIngredient = try context.fetch(fetchIngredientRequest)

            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
            fetchRequest.predicate = NSPredicate(format: "name = %@", r.name)
            let cdRecipe = try context.fetch(fetchRequest)
            let tempRecipe = cdRecipe[0] as! CDRecipe //recipe object that u want add ingredient
            
            //check if exist
            if cdIngredient.count > 0{
                _ = cdIngredient[0] as! CDIngredient
            }
            else{
                let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
                
                let CDIngredient = NSManagedObject(entity: entity, insertInto: context) as! CDIngredient
                
                CDIngredient.setValue(n, forKey: "name")
                CDIngredient.addToRecipes(tempRecipe)
            }
            
            
            try context.save()
            print("Contact Added")
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
    }
    
    /*func retrieveIngredient(rec r: CDRecipe) -> [CDIngredient]? {
        //retrieve ingredient
        let request = CDRecipe.fetchRequest() as NSFetchRequest<CDRecipe>
        request.predicate = NSPredicate(format: "name = %@", r.name!)
        
        do {
            //retrieve recipe
            let result  = try context.fetch(request)
            
            //return ingredient list
            return result[0].ingredients!.allObjects as! [CDIngredient]
        }
        
        catch{
            print(error)
            return nil
        }
    }*/
    
    func retrieveIngredient(rec r: Recipe) -> [CDIngredient]! {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", r.name)
        
        do{
            let cdRecipe = try context.fetch(fetchRequest)
            let tempRecipe = cdRecipe[0] as! CDRecipe //recipe object that u want add ingredient
            
            
            return (tempRecipe.ingredients!.allObjects as! [CDIngredient])
        }
        catch{
            print(error)
            return nil
        }
        
    }
}
