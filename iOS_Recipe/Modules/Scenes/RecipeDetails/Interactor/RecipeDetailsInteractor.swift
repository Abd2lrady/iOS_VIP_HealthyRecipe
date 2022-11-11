//
//  RecipeDetailsInteractor.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol RecipeDetailsInteractorProtocol {
    func interact(request: RecipeDetailsModel.Request)

}

protocol RecipeDetailsDataStore {
    var recipe: RecipeEntity { get set }
}

class RecipeDetailsInteractor: RecipeDetailsDataStore {

    var recipe: RecipeEntity
    let service: RecipeGateway
    let presenter: RecipeDetailsPresenterProtocol
    
    init(recipe: RecipeEntity,
         service: RecipeGateway,
         presenter: RecipeDetailsPresenterProtocol) {
        self.recipe = recipe
        self.service = service
        self.presenter = presenter
    }
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorProtocol {
    
    func interact(request: RecipeDetailsModel.Request) {
        switch request {
        case .viewLoaded:
            viewLoaded()
        }
    }
 
    private func viewLoaded() {
        presenter.present(response: RecipeDetailsModel.Response.recipeDetails(recipe))
    }
}
