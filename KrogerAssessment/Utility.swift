//
//  Utility.swift
//  KrogerAssessment
//
//  Created by Chetan Dhowlaghar on 7/16/24.
//

import Foundation

public enum LoadingState: Equatable {
    public static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case let (.failure(error1), .failure(error2)):
                return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
    
    case none
    case loading
    case success
    case failure(Error)
}
