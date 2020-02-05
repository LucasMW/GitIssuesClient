//
//  IssueListViewController.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
struct IssueListData : Equatable {
    var id : Int
    var title : String
    var open : Bool
}
class IssueListViewController  : UIViewController, NVActivityIndicatorViewable {
    private var viewModel = IssueListViewModel()
    
    var issues = [IssueListData(id: 0, title: "Issue1", open: true),
                  IssueListData(id: 1, title: "Issue2", open: false),
                  IssueListData(id: 2, title: "Issue3", open: true)]
    //dummy data
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        print("IssueList")
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "IssueListTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "IssueListTableViewCell")
         self.startAnimating( message: "Loading", minimumDisplayTime: 2)
        DispatchQueue.init(label: "x").async {
            self.viewModel.loadIssues()
            self.viewModel.issues.observe { (issues) in
                self.issues = issues.count > 0 ? issues : self.issues
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.stopAnimating()
                }
            }
        }
            
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
}
extension IssueListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadDetail(indexPath: indexPath)
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
    func loadDetail(indexPath: IndexPath) {
        let issue = self.issues[indexPath.row]
        
        let detailVC = IssueDetailViewController(nibName: "IssueDetailViewController", bundle: nil)
        detailVC.issueId = issue.id
        let _ = self.navigationController?.display(viewController: detailVC, animated: true)
        //self.navigationController?.pushViewController(detailVC , animated: false)
    }
    
    
}
