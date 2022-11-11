//
//  RecipeDetailsRouter.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation
import SafariServices

protocol RecipeDetailsRouterProtocol {
    func backButtonPushed()
    func recipeWebsiteButtonTapped()
}

class RecipeDetailsRouter {
    weak var view: RecipeDetailsViewProtocol?
    let dataStore: RecipeDetailsDataStore
    
    init(view: RecipeDetailsViewProtocol?,
         dataStore: RecipeDetailsDataStore) {
        self.view = view
        self.dataStore = dataStore
    }
    
}

extension RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    func backButtonPushed() {
        guard let view = view as? RecipeDetailsVC
        else { return }
        view.navigationController?.popViewController(animated: true)
    }

    func recipeWebsiteButtonTapped() {
        let urlString = dataStore.recipe.recipe.url
        guard let url = URL(string: urlString)
        else { return }
        let safariView = SFSafariViewController(url: url)
        guard let view = view as? RecipeDetailsVC
        else { return }
        view.navigationController?.pushViewController(safariView,
                                                      animated: true)
    }
}
