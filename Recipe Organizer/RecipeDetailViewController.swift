//
//  RecipeDetailViewController.swift
//  Recipe Organizer
//
//  Created by Ayush on 06/10/26.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        guard let index = recipeIndex else {
                    return
                }

                let alert = UIAlertController(
                    title: "Delete Recipe",
                    message: "Are you sure you want to delete this recipe?",
                    preferredStyle: .alert
                )

                let cancelAction = UIAlertAction(
                    title: "Cancel",
                    style: .cancel
                )

                let deleteAction = UIAlertAction(
                    title: "Delete",
                    style: .destructive
                ) { _ in

                    if let previousVC =
                        self.navigationController?
                            .viewControllers
                            .dropLast()
                            .last as? ViewController {

                        previousVC.recipes.remove(at: index)

                        previousVC.saveRecipes()

                        previousVC.recipesTableView.reloadData()

                        self.navigationController?
                            .popViewController(animated: true)
                    }
                }

                alert.addAction(cancelAction)
                alert.addAction(deleteAction)

                present(alert, animated: true)
    }
    var recipe: Recipe?
    var recipeIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        displayRecipe()
    }

    func displayRecipe() {

        guard let recipe = recipe else {
            return
        }

        recipeNameLabel.text = recipe.name
        ingredientsTextView.text = recipe.ingredients
        instructionsTextView.text = recipe.instructions
    }
}
