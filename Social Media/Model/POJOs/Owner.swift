//
//  Owner.swift
//  Social Media
//
//  Created by Hassan on 07/06/2022.
//

import Foundation

    struct Owner: Codable {
        let id:String?
        let firstName, lastName: String
        let picture: String?
        let email : String?
        let gender,dateOfBirth, phone: String?
        let location: Location?
        let registerDate, updatedDate: String?
    }

    // MARK: - Location
    struct Location: Codable {
        let street, city, state, country: String?
        let timezone: String?
    }

