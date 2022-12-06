//
//  OwnerViewModel.swift
//  Social Media
//
//  Created by Hassan on 07/06/2022.
//

import Foundation

class OwnerViewModel {
    var apiService : ApiService = ApiService()
    
    var bindStateFromVMToVC : ()->() = {}
    var bindErrorFromVMToVC : ()->() = {}
    var bindOwnerFromVMToVC : ()->() = {}
    var bindFoundStateFromVMToVC : ()->() = {}

    
    
    var owner : Owner!{
        didSet{
            bindOwnerFromVMToVC()
        }
    }
    
    var state : Bool!{
        didSet
        {
            bindStateFromVMToVC()
        }
    }
    
    
    var errorMessage : String!{
        didSet{
            bindErrorFromVMToVC()
        }
    }
    
    var isFound:Bool!
    {
        didSet
        {
            bindFoundStateFromVMToVC()
        }
    }
    
    
    
    
    
    func fetchOwner(ownerId : String)
    {
        apiService.getOwnerData(ownerId: ownerId) { owner, error, state in
            self.state = state
            if let owner = owner {
                self.owner = owner
            }else
            {
                self.errorMessage = error?.localizedDescription
            }
        }
    }
    
    
    
    func createOwner(firstName: String, lastName:String, email:String)
    {
        apiService.createUser(email: email, firstName: firstName, lastName: lastName) { owner, error, state in
            
            if let owner = owner {
                self.state = state
                self.owner = owner
            }else
            {
                self.state = false
                self.errorMessage = error
            }
            
        }
    }
    
    
    func fetchNewOwners(firstName:String, email:String)
    {
        apiService.getNewOwners(firstName: firstName, email: email) { owners, error, state in
            
            self.state = state
            if let owner = owners{
                
                for owner in owner {
                    if owner.firstName == firstName && owner.email == email
                    {
                        
                    }
                }
            }else
            {
                self.errorMessage = error.debugDescription
            }
        }
    }
    
}
