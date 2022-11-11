//
//  Router.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol SearchRecipeRouterProtocol {
    func routeToRecipeDetails(recipe: RecipeEntity)
}

class SearchRecipeRouter {
    let dataStore: SearchRecipeDataStore
    weak var view: SearchRecipeVC?
    
    init(dataStore: SearchRecipeDataStore,
         view: SearchRecipeVC) {
        self.dataStore = dataStore
        self.view = view
    }
    
}

extension SearchRecipeRouter: SearchRecipeRouterProtocol {
    func routeToRecipeDetails(recipe: RecipeEntity) {
        print(recipe)
    }
    
}
