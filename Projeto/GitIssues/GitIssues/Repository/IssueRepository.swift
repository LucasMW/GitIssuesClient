//
//  IssueMemory.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/5/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import Foundation


final class IssueRepository {
    private init() { }
    static let main = IssueRepository()
    var issues : Observable<[IssuesRequest]> = Observable([])
    
    func getIsssuesFrom(_ repo : String){
        print("Calling API")
        let api = API()
        api.requestIssues(from: repo) { (requests, err) in
            guard let requests = requests else {
                print(err?.localizedDescription ?? "Unknown error")
                return
            }
            self.issues.value = requests
            print("API Responded")
        }
    }
    func getIssueOf(_ id : Int) ->  IssuesRequest? {
        let candidates = issues.value.filter({$0.id == id})
        return candidates.first
    }
}
