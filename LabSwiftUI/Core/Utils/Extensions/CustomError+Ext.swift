//
//  CustomError+Ext.swift
//  LabSwiftUI
//
//  Created by Moch. Nor Kholis on 23/11/20.
//

import Foundation

enum URLError: LocalizedError {
    case invalidResponse
    case urlNotReachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "The server responded with garbage."
        case .urlNotReachable(let url): return "\(url.absoluteString) is unreachable."
        }
    }
}

enum DatabaseError: LocalizedError {
    case invalidInstance
    case requestFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance."
        case .requestFailed: return "Your request failed"
        }
    }
}
