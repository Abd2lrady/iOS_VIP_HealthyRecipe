//
//  RecipeDetailsModel.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

enum RecipeDetailsModel {
    enum Request {
        case viewLoaded
    }
    
    enum Response {
        case recipeDetails(RecipeEntity)
    }
    
    struct ViewModel {
        let title: String
        let source: String
        let imgUrl: String
        let ingredients: [String]
        let weightToCal: String
        let time: String
    }
    
}
