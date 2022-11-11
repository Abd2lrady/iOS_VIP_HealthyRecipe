//
//  Router.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol SearchRecipeRouterProtocol {
    func routeToRecipeDetails(recipeIndex: Int)
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
    func routeToRecipeDetails(recipeIndex: Int) {
        print("her start route")
        let recipe = dataStore.recipes[recipeIndex]
        
        let service = (view?.interactor as? SearchRecipeInteractor)?.service
            
        let destination = RecipeDetailsConfigurator.configurate(recipe: recipe,
                                                                service: service ?? RecipeService())
        view?.navigationController?.pushViewController(destination,
                                                       animated: true)
    }
    
}
