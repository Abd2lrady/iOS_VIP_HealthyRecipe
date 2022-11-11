//
//  Constants.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation
// swiftlint: disable type_name  nesting
enum Constants {
    enum API {
        enum Branches {
            static let baseURL = Configuration.baseURLString
        }
    }
    
    enum UserDefaultsKeys {
        static let lastSearches = "lastSearches"
    }

}
