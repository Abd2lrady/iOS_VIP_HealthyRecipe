//
//  Configration.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

enum Configuration: String {

    case develop
    case production
    
    private enum PlistKeys {
        static let environment = "Environment"
    }
    
    private static let infoDict: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist not found")
        }
        return dict
    }()
    
    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?[PlistKeys.environment] as? String else {
            fatalError("environment not found")
        }

        guard let configuration = Configuration(rawValue: rawValue) else {
            fatalError("not valid configuration")
        }

        return configuration
    }()

    static var baseURLString: String {
        switch current {
        case .develop, .production:
            return "api.edamam.com"
        }
    }
    
    static var appId: String {
        switch current {
        case .develop, .production:
            return "a79682ea"
        }
    }
    
    static var appKey: String {
        switch current {
        case .develop, .production:
            return "5384dabbea00f6143974e7090afabd02"
        }
    }
}
