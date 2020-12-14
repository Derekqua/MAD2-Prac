//
//  AddRecipeViewController.swift
//  Revision01
//
//  Created by Derek Qua on 11/12/20.
//

import Foundation
import UIKit

class AddRecipeViewController: UIViewController {

    let recipeController = RecipeController()
    let ingredientController = IngredientController()
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAdd(_ sender: UIButton) {
        var count:Int = 0
        //if either one empty alert wil popup
        if(txtTitle.text!.isEmpty || txtPreparationTime.text!.isEmpty){
            alert("Please populate the title and preparation time.")
        }
        else{
            //create recipe and send to core data
            let newRecipe = recipeController.addRecipe(name: txtTitle.text!, time: txtPreparationTime.text!)
            print("new recipe added.")

            //if not empty add ingredient to recipe
            if(!txtIngredient1.text!.isEmpty){
                //add ingredient to recipe
                ingredientController.addingredient(name: txtIngredient1.text!, rec: newRecipe!)
                count+=1
            }
            if(!txtIngredient2.text!.isEmpty){
                //add ingredient to recipe
                ingredientController.addingredient(name: txtIngredient2.text!, rec: newRecipe!)
                count+=1
            }
            if(!txtIngredient3.text!.isEmpty){
                //add ingredient to recipe
                ingredientController.addingredient(name: txtIngredient3.text!, rec: newRecipe!)
                count+=1
            }
            if(!txtIngredient4.text!.isEmpty){
                //add ingredient to recipe
                ingredientController.addingredient(name: txtIngredient4.text!, rec: newRecipe!)
                count+=1
            }
            if(!txtIngredient5.text!.isEmpty){
                //add ingredient to recipe
                ingredientController.addingredient(name: txtIngredient5.text!, rec: newRecipe!)
                count+=1
            }
        
            
        }
        
        if count == 0 {
            alert("at least 1 ingredient in the 5 testfields cannot be empty.")
        }
        else{
            alert("data successfully added.")
            
            //clearing text
            print("clear text")
            txtTitle.text = ""
            txtPreparationTime.text = ""
            txtIngredient1.text = ""
            txtIngredient2.text = ""
            txtIngredient3.text = ""
            txtIngredient4.text = ""
            txtIngredient5.text = ""
        }
        
    }

    
    //Alert message
    func alert(_ message:String){
            print("Alert: \(message)")
            let alert = UIAlertController(title: "Empty field", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default){_ in
                self.dismiss(animated: true, completion: nil)
            })
            
            self.present(alert, animated: true, completion: nil)
            
        }
}
