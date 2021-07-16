//
//  recipesViewController.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import UIKit

class recipesViewController: UIViewController {
    
    public var ingredientSelected: IngredientDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consultRecipes()
    }
    
    func consultRecipes(){
        let service = consultRecipes_WS()
        service.lookForRecipe(strKeyWord: ingredientSelected?.ingredientName ?? "") { (result) in
            switch result{
            case .failure(let error):
                print("---> failed:",error.localizedDescription)
            case .success(let recipes):
                recipes.forEach({ (recipe) in
                    print(recipe.recipeName)
                })
            }
        }
    }
}

extension recipesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
