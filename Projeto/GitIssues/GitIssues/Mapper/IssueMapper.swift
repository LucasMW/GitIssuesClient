//
//  IssueMapper.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/5/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import UIKit

extension IssuesRequest {
    func toIssueListData() -> IssueListData{
        let open = self.state == "open"
        let data = IssueListData(id: self.id ?? -1 ,title: self.title ?? "???", open: open)
        return data
    }
    
    func toIssueDetailData() -> IssueDetailData {
        let avatar_url = URL(string: self.user?.avatar_url ?? "")
        let imageData = try? Data(contentsOf: avatar_url!)
        let image = UIImage(data: imageData!)
        //to consider: make view model is responsability to tell the view to load imagess from url
        let data = IssueDetailData(title:  self.title ?? "???", userAvatarImage: image!, userName: self.user?.login ?? "???", created: self.created_at ?? "???", issueDescription: self.body ?? "???")
        return data
    }
}
extension Array where Element == IssuesRequest {
    func mapToIssueListData() -> [IssueListData]{
        return self.map({$0.toIssueListData()})
    }
    func mapToIssueDetailData() -> [IssueDetailData]{
        return self.map({$0.toIssueDetailData()})
    }
}
