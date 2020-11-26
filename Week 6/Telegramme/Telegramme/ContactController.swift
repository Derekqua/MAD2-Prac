//
//  ContactController.swift
//  Telegramme
//
//  Created by Derek Qua on 25/11/20.
//
import Foundation
import UIKit
import CoreData


//Contact CRUD
class ContactController{
    
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext

    init() {
        //Refering to the container
       appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a contect for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    //Add a new contact to Core Data
    func AddContact(newContact:Contact) {
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity: entity, insertInto: context)
        contact.setValue(newContact.firstName, forKey: "firstname")
        contact.setValue(newContact.lastName, forKey: "lastname")
        contact.setValue(newContact.mobileNo, forKey: "mobileno")
        
        do{
            try context.save()
            print("Contact Added")
        }catch let error as NSError{
            print("Could not Save.\(error), \(error.userInfo)")
        }
        
        
        
    }
    
    //Retrieve all contacts from Core Data
    func retrieveAllContact() -> [Contact] {
        var contact:[NSManagedObject] = []
        var cList:[Contact]=[]
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                let firstname = c.value(forKey: "firstname") as? String
                let lastname = c.value(forKey: "lastname") as? String
                let mobileno = c.value(forKey: "mobileno") as? String
                let c1 = Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!)
                cList.append(c1)
                //print("\(firstname!) \(lastname!) \(mobileno!)")
            }
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return cList
    }
    
    //Update current contact with new contact
    //fetch data based on mobileno
    func updateContact(mobileno:String,newContact:Contact) {
        /*
        var cList:[NSManagedObject] = []
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            cList = try context.fetch(fetchRequest)
            
            let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
            let contact = NSManagedObject(entity: entity, insertInto: context)

            for c in cList{
                let mobile = c.value(forKey: "mobileno") as? String
                if(mobile == mobileno){
                    contact.setValue(newContact.firstName, forKey: "firstname")
                    contact.setValue(newContact.lastName, forKey: "lastname")
                    contact.setValue(newContact.mobileNo, forKey: "mobileno")
                    print("Contact Updated")
                }
            }
        
            do{
                try context.save()
            }catch let error as NSError{
                print("Could not Save.\(error), \(error.userInfo)")
            }
        
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }*/
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
                
        do {
            
            let contact = try context.fetch(fetchRequest)
            
            let objectUpdate = contact[0] as! NSManagedObject
            objectUpdate.setValue(newContact.firstName, forKey: "firstname")
            objectUpdate.setValue(newContact.lastName, forKey: "lastname")
            objectUpdate.setValue(newContact.mobileNo, forKey: "mobileno")
            
            do {
                try context.save()
            } catch  {
                print(error)
            }
            
            
        } catch  {
            print(error)
        }
        
    }
    
    //Delete contact
    //fetch data based on mobile no
    func deleteContact(mobile:String){
        /*
        var contact:[NSManagedObject] = []

        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                let mobileno = c.value(forKey: "mobileno") as? String
                if(mobileno == mobile){
                    context.delete(c) //deleting contact object from core data)
                    print("Contact deleted")
                }
            }
        
            do{
                try context.save()
            }catch let error as NSError{
                print("Could not Save.\(error), \(error.userInfo)")
            }
        
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }*/
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobile)
        
        do {
            let result = try context.fetch(fetchRequest)
            
            let objecToDelete = result[0] as! NSManagedObject
            context.delete(objecToDelete)
            
            do {
                try context.save()
            } catch  {
                print(error)
            }
            
        } catch  {
            print(error)
        }
    }
    
    
    
}

