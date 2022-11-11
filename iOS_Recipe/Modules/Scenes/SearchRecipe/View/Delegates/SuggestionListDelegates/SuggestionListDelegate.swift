//
//  SearchListDataSource.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class SuggestionListDelegate: NSObject, UITableViewDelegate {
    var selectedSuggest: ((String) -> Void)?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath)
                as? LastSearchListTVCell
        else { return }
        
        selectedSuggest?(cell.lastSearchLabel.text ?? "")
    }
}
