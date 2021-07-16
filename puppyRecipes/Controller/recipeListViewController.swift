//
//  recipeListViewController.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 16/07/21.
//

import UIKit

class recipeListViewController: UIViewController {
    
    public var ingredientSelected: IngredientDataModel?
    var listOfRecipes: [recepiDataModel]?
    @IBOutlet weak var recipeTable: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ingredientSelected?.ingredientName.capitalized ?? ""
        recipeTable.isHidden = true
        consultRecipes()
    }
    
    func consultRecipes(){
        starIndicator()
        let service = consultRecipes_WS()
        guard let keyWord = ingredientSelected?.ingredientName else {return}
        service.lookForRecipe(strKeyWord: keyWord) { (result) in
            switch result{
            case .failure(let error):
                print("---> failed:",error.localizedDescription)
            case .success(let recipes):
                self.listOfRecipes = recipes
                self.recipeTable.reloadData()
                self.stopIndicator()
                self.recipeTable.isHidden =  false
            }
        }
    }
    
    func starIndicator(){
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func stopIndicator(){
        self.indicator.stopAnimating()
        self.indicator.isHidden = true
    }

}

extension recipeListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfRecipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeCell = tableView.dequeueReusableCell(withIdentifier: "recipeTableViewCell", for: indexPath) as? recipeTableViewCell
        recipeCell?.lblRecipeName.text = listOfRecipes?[indexPath.row].recipeName.capitalized
        recipeCell?.lblDescription.text = listOfRecipes?[indexPath.row].description
        let strFirsImage = listOfRecipes?[indexPath.row].ingredients[1]
        let strSecondImage = listOfRecipes?[indexPath.row].ingredients[2]
        let strThirdImage = listOfRecipes?[indexPath.row].ingredients[3]
        recipeCell?.firstImage.image = UIImage(named: strFirsImage ?? "")
        recipeCell?.secondImage.image = UIImage(named: strSecondImage ?? "")
        recipeCell?.thirdImage.image = UIImage(named: strThirdImage ?? "")
        return recipeCell ?? recipeTableViewCell()
    }
    
}
