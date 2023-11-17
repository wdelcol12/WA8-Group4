//
//  ChatViewController.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    let chatView = ChatView()
    var selectedFriendName:String!
    var selectedFriendEmail:String!
    let database = Firestore.firestore()
    let helperObj = DbHelper()
    var msgArray: [Message] = []
    
    override func loadView() {
        view = chatView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedFriendName
        
        chatView.sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        loadMessages()
    }
    
    @objc func loadMessages() {
        let senderUser = UserDefaults.standard.string(forKey: "userToken")
        let receipentUser = selectedFriendEmail
        
        let chatID = helperObj.createChatDocumentID(user1: senderUser!, user2: receipentUser!)
        
        helperObj.getMessages(chatID: chatID) { (messages) in
            if let messageArray = messages {
                for msg in messageArray {
                    self.msgArray.append(msg)
                }
                print("Hello: ")
                print(self.msgArray)
                
//                DispatchQueue.main.async {
//                               self.tableView.reloadData() // Reload table view data
//                           }
            }
        }
    }
    
    @objc func sendMessage() {
        let msgToSend = chatView.messageInputTextField.text!
        
        let senderUser = UserDefaults.standard.string(forKey: "userToken")
        let receipentUser = selectedFriendEmail
        
        let chatID = helperObj.createChatDocumentID(user1: senderUser!, user2: receipentUser!)
        
        helperObj.addChatIDinUserCollection(senderUser: senderUser!, receipentUser: receipentUser!, chatID: chatID)
        
        helperObj.addChatIDinUserCollection(senderUser: receipentUser!, receipentUser: senderUser!, chatID: chatID)
        
        helperObj.addMessages(chatID: chatID, senderUser: senderUser!, receipentUser: receipentUser!, textMsg: msgToSend)

        chatView.messageInputTextField.text = ""
    }

}
