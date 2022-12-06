//
//  Comment.swift
//  Social Media
//
//  Created by Hassan on 04/06/2022.
//

import Foundation


// MARK: - Comment
struct Comment: Codable {
    let data: [Comments]

}

// MARK: - Comments
struct Comments : Codable {
    let  message: String
    let owner: Owner

}

// MARK: - CommentOwner
struct CommentOwner: Codable {
    let firstName, lastName: String
    let picture: String
}
