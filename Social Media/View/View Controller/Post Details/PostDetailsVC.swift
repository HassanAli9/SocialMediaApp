//
//  PostDetailsVC.swift
//  Social Media
//
//  Created by Hassan on 31/05/2022.
//

import UIKit

class PostDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var postDetailsLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var likeNumLabel: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var commentNumLabel: UILabel!
    
    var postViewModel : PostViewModel!
    var commentViewModel : CommentViewModel!
    var indexPath:IndexPath!
    var count:Int?
    var postId:String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CommentCell.nib(), forCellReuseIdentifier: CommentCell.identifier)
    
        displayPost()

        commentViewModel = CommentViewModel(postID: postId)

        
        commentViewModel.bindCountFromVMToVC = gotCountUpdateView
        commentViewModel.bindErrorFromVMToVC = onFailUpdateView
        commentViewModel.bindStateFromVMToVC = onStateStopIndicator
        
        print("HEIGHT \(profileImg.frame.height)")
        print("WIDTH \(profileImg.frame.width)")

        
       
    }
    
    func gotCountUpdateView()
    {
        count = commentViewModel.count
        tableView.reloadData()
    }
    
    func onFailUpdateView()
    {
        showErrorAlert(message: commentViewModel.errorMessage)
    }
    
    func onStateStopIndicator()
    {
        if commentViewModel.state{
            
        }
    }
    
  

    func displayPost()
    {
        if let post = postViewModel.getPost(at: indexPath){
            postId = post.id
        profileImg.setImg(url: post.owner.picture!)
        profileImg.circleImage()
        postImg.setImg(url: post.image)
        userNameLabel.text = post.owner.firstName + " " + post.owner.lastName
        postDetailsLabel.text = post.text
            likeNumLabel.text = String(post.likes)
        
        }
        
    }
    

}

