//
//  IngredientListTVDataSource.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class IngredientListTVDataSource: NSObject {
    
    var ingredients = [String]()
    
}

extension IngredientListTVDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.reuseID,
                                                       for: indexPath) as? IngredientCell
        else { fatalError("can`t deqeue ingredient cell") }
                cell.ingredientLabel.text = ingredients[indexPath.row]
                return cell
        
    }
    
}
