//
//  ServerResponse.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation

struct ServerResponse<ResponseType: Codable>: Codable {

    let hits: ResponseType
    let count: Int?

}
