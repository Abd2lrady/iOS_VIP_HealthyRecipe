//
//  RecipeListDataSource.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady .
//

import UIKit
import Kingfisher

class RecipeListTVDataSource: NSObject {
    var recipes = [SearchRecipeModel.ViewModel]()
}

extension RecipeListTVDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeListTVCell.reuseID,
                                                 
                                                       for: indexPath) as? RecipeListTVCell
        else { fatalError("can`t dequeue recipe cell") }
        let recipe = recipes[indexPath.row]
        configCell(cell: cell, recipe: recipe)
        
        return cell
    }
    
    private func configCell(cell: RecipeListTVCell, recipe: SearchRecipeModel.ViewModel) {
        cell.heathyLabels = recipe.labels
        cell.sourceLabel?.text = recipe.source
        cell.titleLabel?.text = recipe.title
        
        guard let imgURL = URL(string: recipe.imgUrl) else { return }
        let imgResource = ImageResource(downloadURL: imgURL, cacheKey: recipe.imgUrl)
        cell.recipeImg?.kf.setImage(with: imgResource,
                                    options: [.fromMemoryCacheOrRefresh])
    }
    
}
