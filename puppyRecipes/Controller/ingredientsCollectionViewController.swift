//
//  ingredientsCollectionViewController.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import UIKit

class ingredientsCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var ingredientsList: [IngredientDataModel] = []
    let stringList = ["Salmon","Filete","Arroz","Pollo","Zanahoria","Ajo","Cebolla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIngredientList()
    }
    
    func setIngredientList(){
        for string in stringList{
            var ingredient = IngredientDataModel()
            ingredient.ingredientName = string.lowercased()
            ingredientsList.append(ingredient)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ingredientCell = sender as? ingredientViewCell,
        let indexPath = collectionView.indexPath(for: ingredientCell),
        let segue = segue.destination as? recipeListViewController{
            segue.ingredientSelected = ingredientsList[indexPath.row]
        }
    }
}

extension ingredientsCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stringList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let igredientCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientViewCell", for: indexPath) as? ingredientViewCell
        igredientCell?.ingredientIcon.image = setIconName(indexPath: indexPath)
        igredientCell?.ingredientName.text = ingredientsList[indexPath.row].ingredientName.capitalized
        guard let cell = igredientCell else {return ingredientViewCell()}
        return cell
    }
    
    func setIconName(indexPath: IndexPath)-> UIImage{
        let ingredient = ingredientsList[indexPath.row]
        let strIconName = ingredient.ingredientName
        guard let icon = UIImage(named: strIconName) else {return UIImage(systemName: "tray.and.arrow.down") ?? UIImage() }
        return icon
    }
}
