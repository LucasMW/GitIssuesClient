//
//  IssueListViewController.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import UIKit

struct IssueListData : Equatable {
    var title : String
    var open : Bool
}
class IssueListViewController  : ViewController{
    
    var issues = [IssueListData(title: "Issue1", open: true),
    IssueListData(title: "Issue2", open: false),
    IssueListData(title: "Issue3", open: true)]
    //dummy data
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        print("IssueList")
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "IssueListTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "IssueListTableViewCell")
        
        tableView.reloadData()
        
    }
    
}
extension IssueListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadDetail()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = { () -> IssueListTableViewCell in
                   let id = "IssueListTableViewCell"
                   guard let cell = tableView.dequeueReusableCell(withIdentifier: id) as? IssueListTableViewCell else {
                       return IssueListTableViewCell()
                   }
            cell.data = issues[indexPath.row]
            cell.updateValue()
                   return cell
               }()
        return cell
    }
    func loadDetail() {
        let detailVC = IssueDetailViewController(nibName: "IssueDetailViewController", bundle: nil)
        let _ = self.navigationController?.display(viewController: detailVC, animated: true)
        //self.navigationController?.pushViewController(detailVC , animated: false)
    }
    
    
}
