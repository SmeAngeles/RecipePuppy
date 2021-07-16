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
            let request = URLRequest(url: urlComplete)
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                if let error = error{
                    print("---> failed:", error.localizedDescription )
                    guard let recipis = self.lookForRecipeLocal()else{return completion(.failure(error))}
                    return completion(.success(recipis))
                }
                do {
                    let recipis = try JSONDecoder().decode([recepiDataModel].self, from: data!)
                    return completion(.success(recipis))
                }
                catch let jsonError{
                    guard let recipis = self.lookForRecipeLocal()else{return completion(.failure(jsonError))}
                    return completion(.success(recipis))
                }
            }
            task.resume()
        }
    }
    
    func lookForRecipeLocal()-> [recepiDataModel]?{
        guard let  path = Bundle.main.path(forResource: "recipes", ofType: "json")  else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let recipis = try JSONDecoder().decode([recepiDataModel].self, from: data)
            return recipis
        } catch {
            print("---> failed: error al leer el archivo json : ",error )
            return nil
        }
    }
    
    
    
}
