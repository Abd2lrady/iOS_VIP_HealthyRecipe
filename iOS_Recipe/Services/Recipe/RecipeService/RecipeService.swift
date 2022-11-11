//
//  RecipeService.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

class RecipeService: RecipeGateway {
    let remoteRepo: RecipeGateway
    
    init(remoteRepo: RecipeGateway = RemoteRecipeRepository()) {
        self.remoteRepo = remoteRepo
    }
    
    func getRecipes(recipe: String,
                    filter: Filter?,
                    completionHandler: @escaping (Result<[RecipeEntity], Error>) -> Void) {
        
        remoteRepo.getRecipes(recipe: recipe, filter: filter) { result in
            switch result {
            case .failure(let error):
                switch error {
                case APIError.noInternet:
                    completionHandler(.failure(APIError.noInternet))
                    // fallthrough if there is other ways to get recipes
                default:
                    completionHandler(.failure(error))
                }
            case .success(let recipes):
                completionHandler(.success(recipes))
            }
        }

    }
    
}
