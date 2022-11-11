//
//  RecipeService.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import UIKit

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
    
    func loadImage(url: String,
                   completionHandler: @escaping ((Result<UIImage, Error>) -> Void)) {
        
        let cacheManager = ImageCacheClient.shared
        if let image = cacheManager.getImageFromCache(with: url) {
            completionHandler(.success(image))
        } else {
            guard let url = URL(string: url)
            else {
                print("Bad Image URL")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completionHandler(.failure(error))
                    return
                } else if let response = (response as? HTTPURLResponse),
                          !(200...299).contains(response.statusCode) {
                    
                    completionHandler(.failure(APIError.statusCodeError(response.statusCode)))
                    
                } else if let data = data {
                    if let image = UIImage(data: data) {
                        cacheManager.setImageToCache(image: image,
                                                     key: url.description)
                    completionHandler(.success(image))
                    } else {
                        print("bad Image")
                    }
                }
            }.resume()
        }
    }
    
}
