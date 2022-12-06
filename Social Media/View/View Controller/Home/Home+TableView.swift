//
//  Home+TableView.swift
//  Social Media
//
//  Created by Hassan on 04/06/2022.
//

import Foundation
import UIKit


// MARK: UITableViewDataSource
extension HomeVC : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier) as? PostCell else {return UITableViewCell()}
        
        if let currentPost = viewModel.getPost(at: indexPath) {
            
            cell.postDetailsLabel.text = currentPost.text
            cell.likesNumLabel.text = String(currentPost.likes)
            cell.userNameLabel.text = currentPost.owner.firstName + " " + currentPost.owner.lastName
            cell.imgProfile.setImg(url: currentPost.owner.picture!)
            cell.postImg.setImg(url: currentPost.image)
            
        }
        
        
        return cell
    }
    
}

// MARK: UITableViewDelegate

extension HomeVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postDetailsVC = storyboard?.instantiateViewController(withIdentifier: "PostDetailsVC") as! PostDetailsVC
        
        postDetailsVC.indexPath = indexPath
        postDetailsVC.postViewModel = viewModel
        navigationController?.pushViewController(postDetailsVC, animated: true)
        
    }
}
