//
//  RecipeDetailsPresenter.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol RecipeDetailsPresenterProtocol {
    func present(response: RecipeDetailsModel.Response)

}

class RecipeDetailsPresenter {
    weak var view: RecipeDetailsViewProtocol?
    
    init(view: RecipeDetailsViewProtocol?) {
        self.view = view
    }
    
}

extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    func present(response: RecipeDetailsModel.Response) {
        switch response {
        case .recipeDetails(let entity):
            presentRecipe(recipe: entity)
        }
    }
    
    private func presentRecipe(recipe: RecipeEntity) {
        
        let wieghtToCal = "\(recipe.recipe.totalWeight) / \(recipe.recipe.calories)"
        
        let viewModel = RecipeDetailsModel.ViewModel(title: recipe.recipe.label,
                                                     source: recipe.recipe.source,
                                                     imgUrl: recipe.recipe.url,
                                                     ingredients: recipe.recipe.ingredientLines,
                                                     weightToCal: wieghtToCal,
                                                     time: "\(recipe.recipe.totalTime)")
                                                    
        view?.showRecipeDetails(recipe: viewModel)
    }
}
