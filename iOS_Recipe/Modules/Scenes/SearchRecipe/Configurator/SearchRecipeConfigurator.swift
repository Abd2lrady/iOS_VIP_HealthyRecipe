//
//  SearchRecipeConfigurator.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import UIKit

class SearchRecipeConfigurator {
    
    static func configurate() -> UIViewController {
        let view = SearchRecipeVC()
        let presenter = SearchRecipePresenter(view: view)
        let service = RecipeService()
        let interactor = SearchRecipeInteractor(presenter: presenter,
                                                service: service)
        view.interactor = interactor
        let router = SearchRecipeRouter(dataStore: interactor,
                                        view: view)
        view.router = router
        return view
    }
}
