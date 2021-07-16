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
                    return completion(.failure(error))
                }
                do {
                    let recipis = try JSONDecoder().decode([recepiDataModel].self, from: data!)
                    return completion(.success(recipis))
                }
                catch let jsonError{
                    return completion(.failure(jsonError))
                }
            }
            task.resume()
        }
    }
}
