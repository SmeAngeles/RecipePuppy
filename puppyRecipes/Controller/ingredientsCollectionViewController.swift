//
//  ingredientsCollectionViewController.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import UIKit

class ingredientsCollectionViewController: UIViewController {
    
    var ingredientsList: [IngredientDataModel] = []
    let stringList = ["Ajo", "Cebolla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIngredientList()
    }
    
    func setIngredientList(){
        for string in stringList{
            let ingredient = IngredientDataModel()
            ingredient.ingredientName = string
            ingredientsList.append(ingredient)
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
        igredientCell?.ingredientName.text = ingredientsList[indexPath.row].ingredientName
        guard let cell = igredientCell else {return ingredientViewCell()}
        return cell
    }
    
    func setIconName(indexPath: IndexPath)-> UIImage{
        let ingredientName = ingredientsList[indexPath.row]
        let strIconName = ingredientName.setIngredietEnglishName(spanishName: ingredientName.ingredientName)
        if let icon = UIImage(named: strIconName){
            return icon
        }else{
            return UIImage(systemName: "tray.and.arrow.down") ?? UIImage()
        }
        
    }
}
