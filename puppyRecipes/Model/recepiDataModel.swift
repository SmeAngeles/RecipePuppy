//
//  recepiDataModel.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import Foundation

struct recepiDataModel: Decodable{
    let recipeName: String
    let description: String
    let instructions: String
    let mainIngredient: String
    let ingredients: [String]
}
