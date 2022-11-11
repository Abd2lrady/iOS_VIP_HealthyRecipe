//
//  SearchRecipePresenter.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol SearchRecipePresenterProtocol {
    func present(response: SearchRecipeModel.Response)
 }

class SearchRecipePresenter {
    weak var view: SearchRecipeViewProtocol?
    
    init(view: SearchRecipeViewProtocol) {
        self.view = view
    }
}

extension SearchRecipePresenter: SearchRecipePresenterProtocol {
    func present(response: SearchRecipeModel.Response) {
        
        switch response {
        case .lastSearchs(let searchs):
            presentLastSearchs(lastSearchs: searchs)
        
        case .recipes(let recipes):
            presentRecipes(recipes: recipes)
        }
         
    }

    private func presentRecipes(recipes: [RecipeEntity]) {
        guard !recipes.isEmpty else {
            view?.showNoResult()
            return
        }
        let viewModels = recipes.map { recipe in
            SearchRecipeModel.ViewModel(title: recipe.recipe.label,
                                        source: recipe.recipe.source,
                                        imgUrl: recipe.recipe.image,
                                        labels: recipe.recipe.healthLabels)
        }
        view?.hideNoResult()
        view?.showRecipes(recipe: viewModels)
        print(viewModels)
    }
    
    private func presentLastSearchs(lastSearchs: [String]) {
        view?.loadLastSearchs(lastSearchs: lastSearchs)
    }

}
