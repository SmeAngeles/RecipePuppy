//
//  IngredientDataModel.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import Foundation

struct IngredientDataModel{
    var ingredientName:  String = ""
    
    func setIngredietSpanishName(name: String)-> String{
        switch name {
        case "garlic":
            return "Ajo"
        case "onion":
            return "Cebolla"
        case "rice":
            return "Arroz"
        case "salmon":
            return "Salmon"
        case "bistec":
            return "Filete"
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
        case "Arroz":
            return "rice"
        case "Salmon":
            return "salmon"
        case "Filete":
            return "bistec"
        default:
            return "ingrediente"
        }
    }
}

