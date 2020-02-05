//
//  IssueDetailViewController.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

struct IssueDetailData : Equatable {
    var title : String
    var userAvatarImage: UIImage
    var userName: String
    var created : String
    var issueDescription: String
    
    static func dummy() -> IssueDetailData {
        return IssueDetailData(title: "Error: Break in UIApplicationEndBackgroundTaskError() to debug. ", userAvatarImage: UIImage(named: "error-image") ?? UIImage(), userName: "User00001", created: "9/9/9999 12:50:49", issueDescription: """
        GitIssues[40111:1068823] Can't end BackgroundTask: no background task exists with identifier 2 (0x2), or it may have already been ended. Break in UIApplicationEndBackgroundTaskError() to debug.
        """)
    }
}

class IssueDetailViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var details = IssueDetailData.dummy()
    var issueId : Int!
    private var viewModel = IssueDetailsViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    func updateValue() {
        self.titleLabel.text = details.title
        self.userAvatarImage.image = details.userAvatarImage
        self.userNameLabel.text = details.userName
        self.createdLabel.text = details.created
        self.descriptionLabel.text = details.issueDescription
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startAnimating()
        viewModel.issue.observe { (issue) in
            print("Issue Detail, detail changed")
            self.details = issue
            DispatchQueue.main.async {
                self.updateValue()
                self.stopAnimating()
            }
           
        }
        viewModel.loadDetails(id: self.issueId)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func browserButtonAction(_ sender: Any) {
    }
    



}
