//
//  CommentViewModel.swift
//  Social Media
//
//  Created by Hassan on 04/06/2022.
//

import Foundation

class CommentViewModel {
    var apiService: ApiService
    
    var bindStateFromVMToVC: ()->() = {}
    var bindErrorFromVMToVC: ()->() = {}
    var bindCountFromVMToVC: ()->() = {}

    var comment: Comment!
    var state: Bool! {
        didSet {
            bindStateFromVMToVC()
        }
    }
    
    var errorMessage: String! {
        didSet {
            bindErrorFromVMToVC()
        }
    }
    
    var count: Int! {
        didSet {
            bindCountFromVMToVC()
        }
    }
    
    init(postID: String) {
        apiService = ApiService()
        fetchComments(postID: postID)
    }
    
    func getComment(at indexPath: IndexPath)->Comments? {
        return comment.data[indexPath.row]
    }
    
    func fetchComments(postID: String) {
        apiService.getCommentsForPost(postID: postID) { comment, error, state in
            
            self.state = state
            if let comments = comment {
                self.comment = comments
                self.count = comments.data.count
            } else {
                self.errorMessage = error?.localizedDescription
                print(error?.localizedDescription ?? "")
            }
        }
    }
}
