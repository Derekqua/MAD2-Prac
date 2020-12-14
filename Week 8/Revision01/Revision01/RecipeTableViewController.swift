//
//  RecipeTableViewController.swift
//  Revision01
//
//  Created by Derek Qua on 11/12/20.
//

import Foundation
import UIKit

class RecipeTableViewController: UITableViewController {

    let recipeController = RecipeController()
    let ingredientController = IngredientController()
    //var recipelist:[CDRecipe] = []
    var recipelist:[Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //fetch data
        fetchData()
    }
    
    /*func fetchData() {
        if let recipe = recipeController.retrieveRecipe(){
            recipelist = recipe
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }*/
    
    func fetchData() {
        if let recipe = recipeController.retrieveRecipe(){
            recipelist = recipe
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
        return recipelist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        let r = recipelist[indexPath.row]
        cell.textLabel!.text = "\(r.name) (\(r.preparationTime))"
        
       // let ingredientList:[CDIngredient] = ingredientController.retrieveIngredient(rec:v recipelist[indexPath.row])!
        let ingredientList:[CDIngredient] = ingredientController.retrieveIngredient(rec: r)!
        var allList:String = "Ingredient: "
        for i in ingredientList{
            allList += "\(i.name!), "
        }
        
        cell.detailTextLabel?.text = "\(allList)"
        
        return cell
        
    }
    
    

}
