//
//  CreateUserError.swift
//  Social Media
//
//  Created by Hassan on 11/06/2022.
//

import Foundation


struct CreateUserError : Codable {
    let data : ErrorData
}

struct ErrorData : Codable {
    let firstName : String?
    let lastName : String?
    let email : String?
}
