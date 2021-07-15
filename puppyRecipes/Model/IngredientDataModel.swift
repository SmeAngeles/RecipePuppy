//
//  IngredientDataModel.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import Foundation

class IngredientDataModel{
    var ingredientName:  String = ""
    
    func setIngredietSpanishName(name: String)-> String{
        switch name {
        case "garlic":
            return "Ajo"
        case "onion":
            return "Cebolla"
        default:
            return "ingredient"
        }
    }
    
    func setIngredietEnglishName(spanishName: String)-> String{
        switch spanishName {
        case "Ajo":
            return "garlic"
        case "Cebolla":
            return "onion"
        default:
            return "ingrediente"
        }
    }
}

