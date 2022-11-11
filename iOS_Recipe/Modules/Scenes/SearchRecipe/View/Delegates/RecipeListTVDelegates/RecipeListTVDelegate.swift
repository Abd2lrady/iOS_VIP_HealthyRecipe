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
    var loadMore: (() -> Void)?

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRecipe = selectedRecipe else { return }
        selectedRecipe(indexPath.row)
        print("selection cell \(indexPath.row)")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        let yOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let containerHeight = scrollView.bounds.height
        
        if yOffset > ((contentHeight - containerHeight) + 50) {
            loadMore?()
        }
    }

}
