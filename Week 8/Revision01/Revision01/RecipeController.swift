//
//  RecipeController.swift
//  Revision01
//
//  Created by Derek Qua on 11/12/20.
//

import Foundation
import UIKit
import CoreData

class RecipeController{
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    //var item:[CDRecipe] = []
    
    
    init() {
        //Refering to the container
        appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a context for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    /*func addRecipe(name n: String, time t:String) -> CDRecipe{
        let cdRecipe = CDRecipe(context: context)
        let pTime:Int16! = Int16(t)
        
        cdRecipe.name = n
        cdRecipe.preparationTime = pTime!

        do{
            try context.save()
            print("Contact Added")
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
    
    }*/
    
    func addRecipe(name n: String, time t:String) -> Recipe!{
        //let cdRecipe = CDRecipe(context: context)
        let pTime:Int16! = Int16(t)
        
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
        
        let recipe = NSManagedObject(entity: entity, insertInto: context)
        recipe.setValue(n, forKey: "name")
        recipe.setValue(pTime, forKey: "preparationTime")
        
        //create recipe object
        let r = Recipe(t: n, pTime: pTime)
        
        
        do{
            try context.save()
            print("Contact Added")
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
        return r
    
    }
    
    //Retrieve all contacts from Core Data
    func retrieveRecipe() -> [Recipe]! {
        var rList:[NSManagedObject] = []
        var item:[Recipe] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        
        do{
            rList = try context.fetch(fetchRequest)
            
            for c in rList{
                let firstname = c.value(forKey: "name") as? String
                let lastname = c.value(forKey: "preparationTime") as? Int16
                let c1 = Recipe(t: firstname!, pTime: lastname!)
                item.append(c1)
            }
            try context.save()
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
        return item
        
    }
    /*
    func retrieveRecipe() ->[CDRecipe]? {
        
        do {
            let result = try context.fetch(CDRecipe.fetchRequest())
            var rList:[CDRecipe] = []
            
            for data in result as! [CDRecipe]{
                rList.append(data)
            }
            
            item = rList
            return item
        }
        
        catch{
            print(error)
            return nil
        }
 */
        
        
}
    

    

