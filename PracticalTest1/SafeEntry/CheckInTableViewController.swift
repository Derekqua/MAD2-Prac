//
//  CheckInTableViewController.swift
//  SafeEntry
//
//  Created by Derek Qua on 15/12/20.
//

import Foundation
import UIKit

class CheckInTableViewController:UITableViewController{
    
    
    let controller = SafeEntryController()
    var safeList:[SafeEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //fetch data
        fetchData()
    }
    

    
    func fetchData() {
        if let s = controller.FetchSafeEntryData(){
            safeList = s
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //fetch data
        fetchData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return appDelegate.contactList.count
        return safeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
    
        let r = safeList[indexPath.row]
        cell.textLabel!.text = "\(r.mainvenue), \(r.minorvenue)"
        

        // Date Now
        let date:Date = r.datetime

        let dateFormatter = DateFormatter() // set to local date (Singapore)
        dateFormatter.locale = Locale(identifier: "en_SG") // set desired format, note a is AM and FM format
        dateFormatter.dateFormat = "d MMM yyyy h:mm a" // convert date to String
        let datevalue = dateFormatter.string(from: date)
        
        cell.detailTextLabel?.text = "\(datevalue)"
        
        return cell
        
    }
    
    // when a table row is selected, the following delegate is called
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
    
        let appDelegate  = (UIApplication.shared.delegate) as! AppDelegate
        let r = safeList[indexPath.row]
        appDelegate.safeEntry = r
    
    }
}
