//
//  NetworkMonitor.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import Foundation
import SystemConfiguration

class NetworkMonitor {
    
    static let shared = NetworkMonitor()
    private init() {

    }

    let reachability = SCNetworkReachabilityCreateWithName(nil, "localhost")
    var flags = SCNetworkReachabilityFlags()
    
    var isConnected: Bool {
        guard let reachability = reachability else { return false }
        SCNetworkReachabilityGetFlags(reachability, &flags)
        return flags.contains(.reachable)
    }
}
