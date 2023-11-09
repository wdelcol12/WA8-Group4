//
//  MessengerViewController.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//

import UIKit

class MessengerViewController: UIViewController {

    let msgView = MessengerView()
    
    override func loadView() {
        view = msgView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Messages"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.hidesBackButton = true
        
    }
    
    @objc func logout() {
        
    }

}
