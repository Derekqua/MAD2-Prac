//
//  File.swift
//  SafeEntry
//
//  Created by Charles on 4/12/20.
//

import Foundation
import CoreData
import UIKit

class SafeEntryController {
    
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext
    
    
    init() {
        //Refering to the container
        appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a context for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    func SafeEntryDataExist()->Bool {
        var result = false
        //TODO: Question 1(b)(i) check the Core Data if any data exists.
        var rList:[NSManagedObject] = []
        //var item:[SafeEntry] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CD_CheckIn")
        
        do{
            rList = try context.fetch(fetchRequest)
            //check if any data inside core data
            if rList.count < 0{
                result = false
            }
            else{
                result = true
            }
            
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
        
        return result
    }
    
    func FetchSafeEntryData()->[SafeEntry]? {
        var safeEntryList:[SafeEntry] = []
        var checkIn:[NSManagedObject] = []
        
        //TODO: Question 1(b)(ii) fetch all data in the Core Data and convert the data to SafeEntry list
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CD_CheckIn")
        
        do{
            checkIn = try context.fetch(fetchRequest)
            
            for c in checkIn{
                let datetime = c.value(forKey: "cd_datetime") as? Date
                let mainvenue = c.value(forKey: "cd_mainvenue") as? String
                let minorvenue = c.value(forKey: "cd_minorvenue") as? String
                let c1 = SafeEntry(datetime: datetime!, mainvenue: mainvenue!, minorvenue: minorvenue!)
                safeEntryList.append(c1)
            }
            try context.save()
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
        
        
        return safeEntryList
    }
    
    func AddSafeEntryData(s:SafeEntry){
        //TODO: Question 1(b)(iii)  takes in a SafeEntry object and write to the Core Data
        //let cdRecipe = CDRecipe(context: context)
        //let pTime:Int16! = Int16(t)
        
        let entity = NSEntityDescription.entity(forEntityName: "CD_CheckIn", in: context)!
        
        let safeEntry = NSManagedObject(entity: entity, insertInto: context)
        safeEntry.setValue(s.datetime, forKey: "cd_datetime")
        safeEntry.setValue(s.mainvenue, forKey: "cd_mainvenue")
        safeEntry.setValue(s.minorvenue, forKey: "cd_minorvenue")
        
        do{
            try context.save()
            print("SafeEntry object Added into coredata")
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
    }
    
    
}
