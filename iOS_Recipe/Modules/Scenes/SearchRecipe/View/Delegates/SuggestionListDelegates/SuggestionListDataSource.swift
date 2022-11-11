//
//  SuggestionListDataSource.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady on 09/12/2021.
//

import UIKit

class SuggestionListDataSource: NSObject {
    
    private var lastSearches = [String]()
    
    func initLastSearches(lastSearchs: [String]) {
        lastSearches.append(contentsOf: lastSearchs)
    }
    
    func addSuggestion(query: String) {
        if !lastSearches.contains(query) {
            if lastSearches.count < 10 {
                lastSearches.append(query)
                } else {
                    lastSearches[0] = query
                }
        }
    }
}

extension SuggestionListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastSearches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: LastSearchListTVCell.reuseID,
            for: indexPath) as? LastSearchListTVCell
        else { fatalError("can`t dequeue last search cell") }

        cell.lastSearchLabel.text = lastSearches[indexPath.row]
        return cell
    }
    
}
