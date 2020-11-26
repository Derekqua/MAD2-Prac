//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by Derek Qua on 12/11/20.
//

import UIKit

class ShowContactViewController: UITableViewController {
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel?.text = "\(contact.mobileNo)"
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let contact = appDelegate.contactList[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit Contact", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = contact.firstName
                textField.placeholder = "firstName"
            })
            alert.addTextField(configurationHandler: { (textField1) in
                textField1.text = contact.lastName
                textField1.placeholder = "lastName"
            })
            alert.addTextField(configurationHandler: { (textField2) in
                textField2.text = contact.mobileNo
                textField2.placeholder = "mobileNo"
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                contact.firstName = alert.textFields?[0].text! ?? ""
                contact.lastName = alert.textFields?[1].text! ?? ""
                contact.mobileNo = alert.textFields?[2].text! ?? ""
                
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.appDelegate.contactList.remove(at: indexPath.row)
            tableView.reloadData()
        })
        editAction.backgroundColor = .blue
        return [deleteAction, editAction]
    }
    
    
}
