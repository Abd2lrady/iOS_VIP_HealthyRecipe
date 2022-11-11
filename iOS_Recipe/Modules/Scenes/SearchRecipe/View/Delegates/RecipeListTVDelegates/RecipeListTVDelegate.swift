//
//  RecipeListDelegate.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class RecipeListTVDelegate: NSObject, UITableViewDelegate {
    var selectedRecipe: ((Int) -> Void)?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRecipe = selectedRecipe else { return }
        selectedRecipe(indexPath.row)
        print("selection cell \(indexPath.row)")
    }
}
