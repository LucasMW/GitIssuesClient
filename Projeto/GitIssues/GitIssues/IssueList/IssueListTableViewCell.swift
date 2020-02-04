//
//  IssueListTableViewCell.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import UIKit

class IssueListTableViewCell: UITableViewCell {

    var data : IssueListData?
    @IBOutlet weak var openClose: UILabel!
    
    @IBOutlet weak var issueTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateValue(){
        self.issueTitle.text = data?.title
        guard let open = data?.open else {return}
        if(open){
            self.openClose.text = "OPEN"
            self.openClose.textColor = .green
            self.openClose.backgroundColor = .systemFill
        } else {
            self.openClose.text = "CLOSE"
            self.openClose.textColor = .red
            self.openClose.backgroundColor = .systemFill
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
