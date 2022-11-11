//
//  RecipeGatway.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol RecipeGateway {
    
    func getRecipes(recipe: String,
                    filter: Filter?,
                    completionHandler: @escaping (Result<[RecipeEntity], Error>) -> Void)
}
