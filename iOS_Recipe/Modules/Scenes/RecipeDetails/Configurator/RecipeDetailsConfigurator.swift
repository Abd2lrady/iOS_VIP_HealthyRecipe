//
//  RecipeDetailsConfigurator.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import UIKit

class RecipeDetailsConfigurator {
    
    static func configurate(recipe: RecipeEntity,
                            service: RecipeGateway) -> UIViewController {
        
        let view = RecipeDetailsVC()
        let presenter = RecipeDetailsPresenter(view: view)
        let service = RecipeService()
        let interactor = RecipeDetailsInteractor(recipe: recipe,
                                                 service: service,
                                                 presenter: presenter)
        view.interactor = interactor
        let router = RecipeDetailsRouter(view: view, dataStore: interactor)
        view.router = router
        return view
    }
}
