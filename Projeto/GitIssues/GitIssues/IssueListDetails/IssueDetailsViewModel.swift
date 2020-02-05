//
//  IssueDetailsViewModel.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/5/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import Foundation

class IssueDetailsViewModel{
    private var issues: Observable<[IssueDetailData]> = Observable([])
    var repository = IssueRepository.main
    var issue: Observable<IssueDetailData> = Observable(IssueDetailData.dummy())
    
    init() {
        repository.issues.observe { (requests) in
            print("mapping request to details")
            DispatchQueue.init(label: "zz").async {
                self.issues.value = requests.mapToIssueDetailData()
            }
            print("finish mapping")
        }
    }
    func loadDetails(id : Int){
        print("Load Details for id \(id)")
        guard let issue = repository.getIssueOf(id) else {
            return
        }
        print("Loaded")
        self.issue.value = issue.toIssueDetailData()
    }
}
