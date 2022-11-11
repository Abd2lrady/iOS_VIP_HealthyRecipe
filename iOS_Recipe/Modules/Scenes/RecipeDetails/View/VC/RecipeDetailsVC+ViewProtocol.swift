//
//  RecipeDetailsVC+ViewProtocol.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import UIKit
import Kingfisher

protocol RecipeDetailsViewProtocol: AnyObject {
     func setIngredient(ingredient: [String])
    
    func showRecipeDetails(recipe: RecipeDetailsModel.ViewModel)
    
}

extension RecipeDetailsVC: RecipeDetailsViewProtocol {
    func showRecipeDetails(recipe: RecipeDetailsModel.ViewModel) {
    
        titleLabel.text = recipe.title
        setIngredient(ingredient: recipe.ingredients)
        
        guard let imgURL = URL(string: recipe.imgUrl) else { return }
        let imgResource = ImageResource(downloadURL: imgURL, cacheKey: recipe.imgUrl)
        recipeImg.kf.setImage(with: imgResource,
                              options: [.fromMemoryCacheOrRefresh])
    }
    
    func setIngredient(ingredient: [String]) {
        ingredientListTVDataSource.ingredients = ingredient
        ingredientListTV.reloadData()
    }
    
}
