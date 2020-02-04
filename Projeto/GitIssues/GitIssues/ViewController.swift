//
//  ViewController.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable  {

    var loaded = false
    override func viewDidLoad() {
        print("Loading!")
        super.viewDidLoad()
        self.startAnimating( message: "Loading", type: .ballBeat, color: .red, padding: 100, displayTimeThreshold: 4, minimumDisplayTime: 2, backgroundColor: .black, textColor: .systemRed, fadeInAnimation: .none)
        
        if !loaded {
            DispatchQueue.init(label: "xxx").async {
                sleep(3)
                DispatchQueue.main.async {
                    self.stopAnimating()
                    let first = IssueListViewController()
                    first.modalPresentationStyle = .overFullScreen
                                   self.present(first, animated: true) {
                                       self.loaded = true
                               }
                }


            }
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Did Appear \(loaded)")
       
        
    }


}

