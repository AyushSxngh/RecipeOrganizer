//
//  ViewController.swift
//  Recipe Organizer
//
//  Created by Ayush on 30/09/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var recipesTableView: UITableView!

    var recipes: [Recipe] = []
    var selectedRecipe: Recipe?
    var selectedRecipeIndex: Int?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showRecipeDetail" {

            if let detailVC = segue.destination as? RecipeDetailViewController {

                detailVC.recipe = selectedRecipe
                detailVC.recipeIndex = selectedRecipeIndex
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        recipesTableView.dataSource = self
        recipesTableView.delegate = self

        loadRecipes()
        recipesTableView.reloadData()
    }
    
    func saveRecipes() {

        if let encodedData = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.set(encodedData, forKey: "savedRecipes")
        }
    }

    func loadRecipes() {

        if let savedData = UserDefaults.standard.data(forKey: "savedRecipes"),
           let decodedRecipes = try? JSONDecoder().decode(
                [Recipe].self,
                from: savedData
           ) {

            recipes = decodedRecipes
        }
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return recipes.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: "RecipeCell")

        cell.textLabel?.text = recipes[indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        selectedRecipe = recipes[indexPath.row]

        selectedRecipeIndex = indexPath.row

        performSegue(
            withIdentifier: "showRecipeDetail",
            sender: self
        )

        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
        // Do any additional setup after loading the view.
    }


}

