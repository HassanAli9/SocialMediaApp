//
//  PostViewModel.swift
//  Social Media
//
//  Created by Hassan on 31/05/2022.
//

import Foundation

class PostViewModel {
    let apiService: ApiService
    
    // var bindPostFromVMToVC :  ()->() = {}
    var bindErrorFromVMToVC: ()->() = {}
    var bindStateFromVMToVC: ()->() = {}
    var bindCountFromVMToVC: ()->() = {}
    
    var postCount: Int! {
        didSet {
            bindCountFromVMToVC()
        }
    }
    
    var postModel: Post!
    
    var errorMessage: String! {
        didSet {
            bindErrorFromVMToVC()
        }
    }
    
    var responseStatus: Bool! {
        didSet {
            bindStateFromVMToVC()
        }
    }
    
    init() {
        apiService = ApiService()
        fetchAllPosts()
    }
    
    func getPost(at indexPath: IndexPath) -> PostData? {
        return postModel.data[indexPath.row]
    }
    
    func fetchAllPosts() {
        apiService.getAllPosts { post, error, status in
            
            self.responseStatus = status
            if let allPosts = post {
                self.postModel = allPosts
                self.postCount = allPosts.data.count
            } else {
                self.errorMessage = error?.localizedDescription
            }
        }
    }
}
