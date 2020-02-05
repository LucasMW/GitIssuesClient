//
//  IssueListViewModel.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import Foundation

class IssueListViewModel {
    
    var issues: Observable<[IssueListData]> = Observable([])
    var repository = IssueRepository.main
    
    init() {
        repository.issues.observe { (requests) in
            print("Mapping to issueList")
            self.issues.value = requests.mapToIssueListData()
            print("Finish Mapping")
        }
    }
    func loadIssues() {
        
        repository.getIsssuesFrom("apple/swift")
        
    }
}
