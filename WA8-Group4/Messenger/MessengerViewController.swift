//
//  MessengerViewController.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MessengerViewController: UIViewController {

    let msgView = MessengerView()
    let database = Firestore.firestore()

    var friends: [String] = [] // Assuming friends is an array of strings
    
    override func loadView() {
        view = msgView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Messages"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.hidesBackButton = true
        
        msgView.tableViewMessages.delegate = self
        msgView.tableViewMessages.dataSource = self
        
        //MARK: removing the separator line...
        msgView.tableViewMessages.separatorStyle = .none
        
        
        loadFriends()
    }
    
    @objc func loadFriends() {
        let userCollections = database.collection("users")

        userCollections.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if let name = data["name"] as? String {
                        if(data["email"] as? String != UserDefaults.standard.string(forKey: "userToken")) {
                            self.friends.append(name)
                        }
                        
                    }
                }
                self.msgView.tableViewMessages.reloadData()
            }
        }
    }

    //Change from String to Chat Model
    func openChatWindow(name: String){
        let chatViewController = ChatViewController()
        chatViewController.selectedFriendName = name
        chatViewController.selectedFriendEmail = name // RR changes
        navigationController?.pushViewController(chatViewController, animated: true)
    }

    
    @objc func logout() {
        do {
            try Auth.auth().signOut()
            
        }
        catch {
            print("already logged out")
        }
            UserDefaults.standard.removeObject(forKey: "userToken")
            navigationController?.popToRootViewController(animated: true)
    }

}
