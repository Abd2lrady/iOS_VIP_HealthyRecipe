//
//  SearchRecipeInteractor.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

protocol SearchRecipeInteractorProtocol {
    func interact(request: SearchRecipeModel.Request)
}

protocol SearchRecipeDataStore {
    var recipes: [RecipeEntity] { get set }
}

class SearchRecipeInteractor: SearchRecipeDataStore {

    let presenter: SearchRecipePresenterProtocol
    let service: RecipeGateway
    var recipes = [RecipeEntity]()
    
    init(presenter: SearchRecipePresenterProtocol,
         service: RecipeGateway) {
        self.presenter = presenter
        self.service = service
    }

}

extension SearchRecipeInteractor: SearchRecipeInteractorProtocol {
    func interact(request: SearchRecipeModel.Request) {
        switch request {
        case .viewLoaded:
            viewLoaded()
            
        case .getRecipes(let query, let filter):
            getRecipes(query: query, filter: filter)
            
        case .addSearchSuggestion(let search):
            saveLastSearch(query: search)
        }
    }
    
    private func viewLoaded() {
        
        guard let lastSearches = UserDefaults.standard.stringArray(forKey: Constants.UserDefaultsKeys.lastSearches)
        else {
            print("no saved searchs")
            return }
        presenter.present(response: .lastSearchs(lastSearches))
    }
    
    private func getRecipes(query: String, filter: Filter?) {
        service.getRecipes(recipe: query,
                           filter: filter) { [weak self] result in
            switch result {
            case .success(let response):
                self?.presenter.present(response: SearchRecipeModel.Response.recipes(response))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func saveLastSearch(query: String) {
        var lastSearches: [String] = UserDefaults.standard.stringArray(forKey: Constants.UserDefaultsKeys.lastSearches) ?? []

            lastSearches.append(query)
            UserDefaults.standard.set(lastSearches,
                                      forKey: Constants.UserDefaultsKeys.lastSearches)
        }

}
