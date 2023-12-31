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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFriends()
        // Other code to refresh or update the view can go here
    }
    
    @objc func loadFriends() {
        let userCollections = database.collection("users")
        print("see 1")
        userCollections.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    print("see 2")
                    if let name = data["name"] as? String, let email = data["email"] as? String {
                        if(data["email"] as? String != UserDefaults.standard.string(forKey: "userToken")) {
                            //find the chatID
                            print("see 3")
                            self.createFriend(name: name, email: email)
                        }
                        
                    }
                }
            }
        }
    }
    
    @objc func createFriend(name: String, email: String){
        print("see 4")
        self.friends.removeAll()
        
        let receipentUser = email
        let chatID = self.helperObj.createChatDocumentID(user1: self.senderUser, user2: receipentUser)
        
        //find last message
        var msgArray: [Message] = []
        
        self.database.collection("chats")
            .document(chatID)
            .collection("messages")
            .order(by: "timestamp", descending:false)
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                print("see 5")
                if let documents = querySnapshot?.documents{
                    print("see 6")
                    msgArray.removeAll()
                    for document in documents {
                        do {
                            print("see 7")
                            let msg = try document.data(as: Message.self)
                            msgArray.append(msg)
                            
                        } catch {
                            print(error)
                        }
                    }
                    
                    var lastMessage: String?
                    var timestamp: String?
                    
                    if let last = msgArray.last {
                        print("see 8")
                        lastMessage = last.text
                        timestamp = last.timestamp
                        // Use the lastMessage here
                        print("Last Message: \(String(describing: lastMessage))")
                    } else {
                        print("see 9")
                        // The array is empty
                        lastMessage = ""
                        timestamp = ""
                    }
                    
                    if let lastMessageText = lastMessage, let lastMessageTimestamp = timestamp {
                        if let index = self.friends.firstIndex(where: { $0.email == email }) {
                            self.friends[index].lastMessage = lastMessageText
                            self.friends[index].time = lastMessageTimestamp
                        } else {
                            let friend = Friend(name: name, lastMessage: lastMessageText, time: lastMessageTimestamp, email: email)
                            print("see 10: ", self.friends.count)
                            self.friends.append(friend)
                        }

                    } else {
                        // Handle the case where lastMessageText or lastMessageTimestamp is nil
                        print("No last message available")
                    }
                    // Sort the friends array based on timestamp
                    self.friends.sort { (friend1, friend2) -> Bool in
                        // Assuming timestamp is a String in the format of a date
                        return friend1.time > friend2.time
                    }
                    self.msgView.tableViewMessages.reloadData()
                }
            } )
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
