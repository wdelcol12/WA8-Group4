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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "chat", style: .plain, target: self, action: #selector(chat))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
    }
    
    @objc func logout() {
        
    }
    
    @objc func chat() {
        let chatPage = ChatViewController()
        navigationController?.pushViewController(chatPage, animated: true)
    }

}
