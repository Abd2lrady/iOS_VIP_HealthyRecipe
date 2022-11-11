//
//  RemoteRecipeRepository.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

class RemoteRecipeRepository {
    
    let client: APIClient
    let decoder: JSONDecoder
    
    init(client: APIClient = APIClient.shared,
         decoder: JSONDecoder = JSONDecoder()) {
        self.client = client
        self.decoder = decoder
    }
    
}

extension RemoteRecipeRepository: RecipeGateway {
    func getRecipes(recipe: String,
                    filter: Filter?,
                    completionHandler: @escaping (Result<[RecipeEntity], Error>) -> Void) {
        client.request(for: RecipeRouter.getRecipe(query: recipe, filter: filter)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                do {
                    let response = try self.decoder.decode(ServerResponse<[RecipeEntity]>.self,
                                                           from: data)
                    completionHandler(.success(response.hits))
                    print(response.hits)
                } catch {
                    completionHandler(.failure(error))
                }
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
