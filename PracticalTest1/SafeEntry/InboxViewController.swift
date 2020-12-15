//
//  ViewController.swift
//  SafeEntry
//
//  Created by Charles on 2/12/20.
//

import UIKit

class InboxViewController: UIViewController {

    let appDelegate  = (UIApplication.shared.delegate) as! AppDelegate
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblVenue: UILabel!
    
    var safeEntry:SafeEntry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_SG")
        dateFormatter.dateFormat = "d MMM yyyy"
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "en_SG")
        timeFormatter.dateFormat = "h:mm a"
        
        
        // TODO: Question 2(b) Pass the safeEntry data from appDelegate
        safeEntry =  appDelegate.safeEntry
        
        
        let n = safeEntry!.datetime
        let datevalue = dateFormatter.string(from: n)
        let timevalue = timeFormatter.string(from: n)
        
        lblVenue.text = "\(safeEntry!.mainvenue.uppercased()) \n \(safeEntry!.minorvenue.uppercased())"
        lblDate.text = datevalue.uppercased()
        lblTime.text = timevalue
        
    }


}

