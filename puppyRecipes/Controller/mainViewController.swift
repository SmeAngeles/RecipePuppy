//
//  mainViewController.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import UIKit

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func acGoToIngredientList(_ sender: Any) {
        performSegue(withIdentifier: "IngredientList", sender: nil)
    }
}
