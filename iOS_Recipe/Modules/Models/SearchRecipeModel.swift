//
//  SearchRecipeModel.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

enum SearchRecipeModel {
    enum Request {
        case viewLoaded
        case getRecipes(query: String, filter: Filter?)
        case addSearchSuggestion(search: String)
        case loadMore
    }
    
    enum Response {
        case recipes([RecipeEntity])
        case lastSearchs([String])
    }
    
    struct ViewModel {
        let title: String
        let source: String
        let imgUrl: String
        let labels: [String]
    }
    
}
