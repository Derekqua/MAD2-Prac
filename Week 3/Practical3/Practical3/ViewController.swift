//
//  ViewController.swift
//  Practical3
//
//  Created by Derek Qua on 3/11/20.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBAction func onClick(_ sender: UIButton) {
        myLabel.text = "Button has been clicked"
        print("Button has been CLicked!")
    }
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var txtField: UITextField!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        myLabel.text = txtField.text
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtField.delegate = self // the delegate is defined in this class
    }
    
    

    

}

