//
//  IngredientDataModel.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import Foundation

struct IngredientDataModel{
    var ingredientName:  String = ""
    func setIngredietEnglishName(spanishName: String)-> String{
        switch spanishName {
        case "ajo":
            return "garlic"
        case "cebolla":
            return "onion"
        case "arroz":
            return "rice"
        case "salmon":
            return "salmon"
        case "filete":
            return "steak"
        case "pollo":
            return "chicken"
        case "zanahoria":
            return "carrot"
        default:
            return "ingrediente"
        }
    }
}

