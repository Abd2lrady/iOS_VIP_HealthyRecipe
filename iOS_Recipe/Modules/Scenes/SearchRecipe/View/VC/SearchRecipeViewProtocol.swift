//
//  SearchRecipeViewProtocol.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import UIKit

protocol SearchRecipeViewProtocol: AnyObject {
    
    func showRecipes(recipe: [SearchRecipeModel.ViewModel])    
    func routeToRecipeDetails(recipe: Recipe)
    func showNoResult()
    func hideNoResult()
    func showLastSearchs()
    func loadLastSearchs(lastSearchs: [String])
}
