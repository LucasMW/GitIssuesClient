//
//  API.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/5/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import Foundation

import Alamofire
import ObjectMapper

class API {
    let baseAPI = "https://api.github.com/"
    func requestIssues(from repository : String = "apple/swift", completion : @escaping ([IssuesRequest]?,Error?)->()){
        let url = "\(baseAPI)repos/\(repository)/issues"
        Alamofire.request(url, method: .get).responseString { (res) in
            switch res.result {
            case .success(let json):
                
                guard let issues = Mapper<IssuesRequest>().mapArray(JSONString: json)
                else {
                    let error = NSError(domain: "Could not parse server response", code: 1, userInfo: nil)
                    completion(nil, error as Error)
                        return
                }
                completion(issues,nil)
                
                
            case .failure(let err):
                print(err)
                let error = NSError(domain: "Could not complete request to server", code: 2, userInfo: ["description" : err.localizedDescription]) as Error
                completion(nil,error)
            }
        }
    }
    
}
