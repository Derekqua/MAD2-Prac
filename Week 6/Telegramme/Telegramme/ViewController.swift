//
//  ViewController.swift
//  Telegramme
//
//  Created by Derek Qua on 12/11/20.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func onclick(_ sender: Any) {
        if true { //if username and password
            let storyboard =  UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen //try without fullscreen
            present(vc, animated: true, completion:nil)
            
        }
    }
    
    @IBOutlet weak var pwdFld: UITextField!
    @IBOutlet weak var usrNameFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

