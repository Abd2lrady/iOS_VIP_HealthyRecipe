//
//  APIRouter.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

enum RecipeRouter {
    case getRecipe(query: String, filter: Filter?)
}

extension RecipeRouter: APIRouterProtocol {

    var scheme: NetworkRequestScheme {
        switch self {
        case .getRecipe:
            return .HTTPS
        }
    }
    
    var baseURL: String {
        switch self {
        case .getRecipe:
            return Configuration.baseURLString
        }
    }
    
    var path: String {
        switch self {
        case .getRecipe:
            return "/search"
        }
    }
    
    var method: NetworkRequestMethod {
        switch self {
        case .getRecipe:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        let appKey = Configuration.appKey
        let appId = Configuration.appId
        
        switch self {
        case .getRecipe(let search, let filter):
            var param = ["q": search, "app_key": appKey, "app_id": appId]
            if let filter = filter?.rawValue {
                param["health"] = filter
            }
            return param
        }
    }
    
    var paramEncoding: ParamEncoding {
        switch self {
        case .getRecipe:
            return .url
        }
    }

    var headers: [String: String]? {
        return nil
    }
    
}
