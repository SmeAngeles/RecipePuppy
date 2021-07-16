//
//  consultRecipes_WS.swift
//  puppyRecipes
//
//  Created by Esmeralda Angeles Mendoza on 15/07/21.
//

import Foundation

public class consultRecipes_WS{
    
    let endpoint = "http://www.recipepuppy.com/api/"
    
    func lookForRecipe(strKeyWord: String, completion: @escaping (Result<[recepiDataModel],Error >) -> ()){
        if let urlComplete = URL(string: "\(endpoint)\(strKeyWord)"){
            
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 5
            let session = URLSession(configuration: configuration)
            let request = URLRequest(url: urlComplete)
            let task = session.dataTask(with: request){ data, response, error in
                if let error = error{
                    print("---> failed:", error.localizedDescription )
                    guard let recipis = self.lookForRecipeLocal(strKeyWord: strKeyWord)else{return completion(.failure(error))}
                    DispatchQueue.main.sync{ return completion(.success(recipis))}
                }
                do {
                    guard let data = data  else{return}
                    let recipis = try JSONDecoder().decode([recepiDataModel].self, from: data)
                    DispatchQueue.main.sync{return completion(.success(recipis))}
                }
                catch let jsonError{
                    guard let recipis = self.lookForRecipeLocal(strKeyWord: strKeyWord)else{return completion(.failure(jsonError))}
                    DispatchQueue.main.sync{ return completion(.success(recipis))}
                }
            }
            task.resume()
        }
    }
    
    func lookForRecipeLocal(strKeyWord: String)-> [recepiDataModel]?{
        guard let  path = Bundle.main.path(forResource: "recipes", ofType: "json")  else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let listOfRecipes = try JSONDecoder().decode([recepiDataModel].self, from: data)
            
            let list = listOfRecipes.filter { (recipe) -> Bool in
                recipe.mainIngredient == strKeyWord || recipe.ingredients.contains(strKeyWord)
            }
            return list
        } catch {
            print("---> failed: error al leer el archivo json : ",error )
            return nil
        }
    }
    
    
}
