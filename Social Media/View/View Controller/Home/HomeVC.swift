//
//  HomeVC.swift
//  Social Media
//
//  Created by Hassan on 29/05/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel : PostViewModel = PostViewModel()
    var count : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(PostTVC.nib(), forCellReuseIdentifier: PostTVC.identifire)
        
        
        tableView.alpha = 0.0
        viewModel.bindErrorFromVMToVC = onFailUpdateView
        viewModel.bindStateFromVMToVC = onStateStopIndicator
        viewModel.bindCountFromVMToVC = gotCountUpdateView
        
        NotificationCenter.default.addObserver(self, selector: #selector(ownerTapped), name: NSNotification.Name("ownerSVTapped"), object: nil)
        
    }
    
    func gotCountUpdateView(){
        count = viewModel.postCount
        tableView.reloadData()
    }
   
    
    func onFailUpdateView()
    {
       showErrorAlert(message: viewModel.errorMessage)
    }
    
    func onStateStopIndicator()
    {
        if viewModel.responseStatus {
            activityIndicator.stopAnimating()
            tableView.alpha = 1.0
        }
    }
    
    @objc func ownerTapped(notfication : Notification)
    {
        if  let cell =  notfication.userInfo?["cell"] as? PostTVC {
            guard  let indexPath =     tableView.indexPath(for: cell) else {return}
            
            guard let id =   viewModel.getPost(at: indexPath)?.owner.id else {return}

            let userProfileVC = storyboard?.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
            print(id)
            userProfileVC.id = id
            
            present(userProfileVC, animated: true, completion: nil)
        
        
        }
     
        
    }
    
    
}

