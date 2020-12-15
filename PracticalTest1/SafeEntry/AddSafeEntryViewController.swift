//
//  AddSafeEntryViewController.swift
//  SafeEntry
//
//  Created by Derek Qua on 15/12/20.
//

import Foundation
import UIKit

class AddSafeEntryViewController: UIViewController {
    let controller = SafeEntryController()
    
    @IBOutlet weak var txtMainLocation: UITextField!
    
    @IBOutlet weak var txtMinorLocation: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }


    @IBAction func btnAdd(_ sender: Any) {
        //check if major location empty
        print("testing")



            // Date Now
            let date:Date = Date()
            
            let obj = SafeEntry(datetime: date, mainvenue: txtMainLocation.text!, minorvenue: txtMinorLocation.text!)
            
            controller.AddSafeEntryData(s: obj)
 
    }
}

