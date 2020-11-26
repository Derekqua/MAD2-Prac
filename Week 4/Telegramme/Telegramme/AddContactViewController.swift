//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by Derek Qua on 12/11/20.
//

import Foundation
import UIKit

class AddContactViewController : UIViewController{
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.contactList.count))
        
        //Exercise 1
        let c1 = Contact(firstname: firstNameFld.text ?? "", lastname: lastNameField.text ?? "", mobileno: mobileField.text!)
        appDelegate.contactList.append(c1)
        
    }
    @IBAction func cancelButton(_ sender: Any) {
        
        firstNameFld.text=""
        lastNameField.text=""
        mobileField.text=""
    }
}
