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
    let helperObj = DbHelper()
    
    //    var friends: [String] = [] // Assuming friends is an array of strings
    var friends = [Friend]()
    let senderUser = UserDefaults.standard.string(forKey: "userToken")!
    
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
                    
                    if let name = data["name"] as? String, let email = data["email"] as? String {
                        if(data["email"] as? String != UserDefaults.standard.string(forKey: "userToken")) {
                            //find the chatID
                            self.createFriend(name: name, email: email)
                        }
                        
                    }
                }
                self.msgView.tableViewMessages.reloadData()
            }
        }
    }
    
    @objc func createFriend(name: String, email: String){
        let receipentUser = email
        let chatID = self.helperObj.createChatDocumentID(user1: self.senderUser, user2: receipentUser)
        
        //find last message
        var msgArray: [Message] = []

        self.helperObj.getMessages(chatID: chatID) { (messages) in
            if let messageArray = messages {
                for msg in messageArray {
                    print("should be here")
                    msgArray.append(msg)
                }
                print("Hello: ")
                print(msgArray)
                var lastMessage: String?
                var timestamp: String?
                
                if let last = msgArray.last {
                    lastMessage = last.text
                    timestamp = last.timestamp
                    // Use the lastMessage here
                    print("Last Message: \(String(describing: lastMessage))")
                } else {
                    // The array is empty
                    lastMessage = ""
                    timestamp = ""
                }

                if let lastMessageText = lastMessage, let lastMessageTimestamp = timestamp {
                    let friend = Friend(name: name, lastMessage: lastMessageText, time: lastMessageTimestamp, email: email)
                    print("Friend Object: \(friend)")
                    self.friends.append(friend)

                } else {
                    // Handle the case where lastMessageText or lastMessageTimestamp is nil
                    print("No last message available")
                }
                self.msgView.tableViewMessages.reloadData()
            }
        }
    }
    
    //Change from String to Chat Model
    func openChatWindow(name: String, email: String){
        let chatViewController = ChatViewController()
        chatViewController.selectedFriendName = name
        chatViewController.selectedFriendEmail = email
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
