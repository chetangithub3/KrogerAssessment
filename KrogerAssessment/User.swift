//
//  User.swift
//  KrogerAssessment
//
//  Created by Chetan Dhowlaghar on 7/15/24.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let emailAddress: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "fname"
        case lastName = "lname"
        case phoneNumber = "phone"
        case emailAddress = "email"
        case gender
    }
}
