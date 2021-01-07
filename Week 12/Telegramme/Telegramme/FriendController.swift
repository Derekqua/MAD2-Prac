//
//  FriendController.swift
//  Telegramme
//
//  Created by Derek Qua on 26/11/20.
//

import Foundation
import UIKit
import CoreData

//Contact CRUD
class FriendController {
    
    var appDelegate:AppDelegate
    let context:NSManagedObjectContext

    init() {
        //Refering to the container
       appDelegate  = (UIApplication.shared.delegate) as! AppDelegate

        //Create a contect for this container
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    func AddFriend(friend:Friend)  {

        
        //Create an entity and a new friend record
        let friendEntity = NSEntityDescription.entity(forEntityName:"CDFriend", in:context)!
        
        //friend record
        let friendObj = NSManagedObject(entity:friendEntity, insertInto: context)
        friendObj.setValue(friend.name , forKeyPath:"name")
        friendObj.setValue(friend.profileImageName , forKeyPath:"profileImageName")
        
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message) {

        
        //Create an entity and a new friend record
        let messageEntity = NSEntityDescription.entity(forEntityName:"CDMessage", in:context)!
        
        //friend record
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name)
        
        
        do {
            let friendlist = try context.fetch(fetchRequest)
            let f = friendlist[0]
            
            let messageObj = NSManagedObject(entity:messageEntity, insertInto: context)
            messageObj.setValue(message.isSender , forKeyPath:"isSender")
            messageObj.setValue(message.text , forKeyPath:"text")
            messageObj.setValue(message.date , forKeyPath:"date")
            messageObj.setValue(f , forKeyPath:"friend")
            
            try context.save()
        } catch  {
            print(error)
        }
    }
    
    func retriveMessagesByFriend(friend:Friend) -> [Message]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name)
        
        //List of the contact
        var messages:[Message] = []
        
        do {
            let result = try context.fetch(fetchRequest)
            let fri = result[0] as! NSManagedObject
            
            let messagesList = fri.value(forKey: "message")
            
            for f in messagesList as! [NSManagedObject] {
                let message:Message = Message(text: f.value(forKey: "text") as! String, isSender: f.value(forKey: "isSender") as! Bool, date: f.value(forKey: "date") as! Date)
                
                messages.append(message)
            }
            

            return messages
        } catch  {
            print("Failed")
            return []
        }
    }
}
