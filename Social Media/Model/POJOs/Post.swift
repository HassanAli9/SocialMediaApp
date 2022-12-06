//
//  Post.swift
//  Social Media
//
//  Created by Hassan on 31/05/2022.
//

import Foundation

struct Post: Codable {
    let data : [PostData]
}

// MARK: - PostData
struct PostData : Codable {
    let id: String
    let image: String
    let likes: Int
    let tags: [String]
    let text, publishDate: String
    let owner: Owner
}


