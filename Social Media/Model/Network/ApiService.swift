//
//  ApiService.swift
//  Social Media
//
//  Created by Hassan on 31/05/2022.
//

import Foundation
import Alamofire
class ApiService
{
    let heaader : HTTPHeaders = ["app-id" : "629664d1a085f426eea3a3ae"]
    var baseURL = "https://dummyapi.io/data/v1"
    
    func getAllPosts(completion:@escaping (Post? , Error? ,Bool) -> ()){
        
        baseURL += "/post"
        
        
     
    AF.request(baseURL , headers: heaader).responseDecodable(of: Post.self) { response in
            switch response.result
            {
            case .success(_) :
                guard let post = response.value else {return}
                completion(post , nil,true)
                
            case .failure(let error):
                completion(nil , error,true)
            }
            
        }
        
    }
    
    
    func getCommentsForPost(postID : String , completion : @escaping (Comment? , Error? , Bool) -> ())
    {
        let commentUrl = "https://dummyapi.io/data/v1/post/\(postID)/comment"
        
        AF.request(commentUrl , headers: heaader).responseDecodable(of: Comment.self) { response in
            switch response.result{
                
            case .success(_):
                guard let comment = response.value else {return}
                // print("COMMENT : \(comment)")
                completion(comment,nil,true)
                
            case .failure(let error):
                completion(nil,error,true)
                
            }
            
        }
    }
    
    
    func getOwnerData(ownerId : String, completionHandler : @escaping (Owner? , Error? , Bool) -> ())
    {
        print(ownerId)
        let ownerUrl = "https://dummyapi.io/data/v1/user/" + ownerId
        
        AF.request(ownerUrl , headers: heaader).responseDecodable(of: Owner.self) { response in
            switch response.result
            {
            case .success(_):
                guard let owner = response.value else {return}
                completionHandler(owner,nil,true)
                
            case .failure(let error):
                completionHandler(nil,error,true)
                
            }
        }
    }
    
    
    func createUser (email:String, firstName:String, lastName:String, completion: @escaping (Owner? , String? , Bool)->() )
    {
        let user = [
            "firstName": firstName,
            "lastName" : lastName,
            "email"    : email
        ]
        
        let createUserURL = "https://dummyapi.io/data/v1/user/create"
        
        AF.request(createUserURL, method: .post, parameters: user, encoder: JSONParameterEncoder.default ,headers: heaader).validate().responseDecodable(of: Owner.self) { response in
            
            
            switch response.result
            {
            case .success:
                guard let owner = response.value else {return}
                print(owner)
                completion(owner,nil,true)
                
            case .failure:
                do{
                    let error = try JSONDecoder().decode(CreateUserError.self, from: response.data!)
                    completion(nil,error.data.email,true)
                    
                }catch
                {
                    print("Failed Decoding")
                }
                
            }
        }
        
    }
    
    
    
    func getNewOwners(firstName:String , email:String, completionHandler : @escaping ([Owner]? , Error? , Bool) -> ())
    {
        let param = ["create":"1"]
        let ownerUrl = "https://dummyapi.io/data/v1/user"
        
        AF.request(ownerUrl ,parameters: param,encoder: URLEncodedFormParameterEncoder.default ,  headers: heaader).responseDecodable(of: [Owner].self) { response in
            switch response.result
            {
            case .success(_):
                guard let owner = response.value else {return}
                completionHandler(owner,nil,true)
                
            case .failure(let error):
                completionHandler(nil,error,true)
                
            }
        }
    }
}
