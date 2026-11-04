//
//  AddRecipeViewController.swift
//  Recipe Organizer
//
//  Created by Ayush on 06/10/26.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var recipeNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        let name = recipeNameTextField.text ?? ""
        let ingredients = ingredientsTextView.text ?? ""
        let instructions = instructionsTextView.text ?? ""

        if name.isEmpty || ingredients.isEmpty || instructions.isEmpty {
            return
        }

        let newRecipe = Recipe(
            name: name,
            ingredients: ingredients,
            instructions: instructions
        )

        if let previousVC = navigationController?.viewControllers.dropLast().last as? ViewController {

            previousVC.recipes.append(newRecipe)

            previousVC.saveRecipes()

            previousVC.recipesTableView.reloadData()
        }

        navigationController?.popViewController(animated: true)
    }
}
