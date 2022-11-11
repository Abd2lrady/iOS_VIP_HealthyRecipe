//
//  SearchRecipeVC+ViewProtocol.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension SearchRecipeVC: SearchRecipeViewProtocol {
    
    func loadLastSearchs(lastSearchs: [String]) { suggestionListDataSource.initLastSearches(lastSearchs: lastSearchs)
    }
    
    func showLastSearchs() {
        suggestionList.reloadData()
        showList()
    }
        
    func showRecipes(recipe: [SearchRecipeModel.ViewModel]) {
        recipeListDataSource.recipes = recipe
        recipeListTV.reloadData()
        view.hideActivityIndicator()
    }
    
    func showNoResult() {
        recipeListTV.isHidden = true
        noResultView.isHidden = false
        view.hideActivityIndicator()
    }
    
    func hideNoResult() {
        recipeListTV.isHidden = false
        noResultView.isHidden = true
    }
    
//    func recipesFiltered(recipes: [SearchRecipeModel.ViewModel]) {
//        if recipes.isEmpty {
//            showNoResult()
//        } else {
//            recipeListDataSource.recipes = recipes
//            recipeListTV.reloadData()
//            hideNoResult()
//        }
//    }
        
    func searchesSaved() {
        suggestionList.reloadData()
    }
    
    func routeToRecipeDetails(recipe: Recipe) {
        print("route to details")

    }
}
