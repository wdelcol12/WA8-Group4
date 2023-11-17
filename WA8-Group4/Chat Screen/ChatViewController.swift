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
    override func loadView() {
        view = chatView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedFriendName
        
        chatView.sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }
    
    @objc func sendMessage() {
        let msgToSend = chatView.messageInputTextField.text!
        
        let senderUser = UserDefaults.standard.string(forKey: "userToken")
        let receipentUser = selectedFriendEmail
        
        let chatCollection = database.collection("chats")
        let userCollection = database.collection("users")
        
        let chatID = helperObj.createChatDocumentID(user1: senderUser!, user2: receipentUser!)
        
        helperObj.addChatIDinUserCollection(senderUser: senderUser!, receipentUser: receipentUser!, chatID: chatID)
        
        helperObj.addChatIDinUserCollection(senderUser: receipentUser!, receipentUser: senderUser!, chatID: chatID)
        
        helperObj.addMessages(chatID: chatID, senderUser: senderUser!, receipentUser: receipentUser!, textMsg: msgToSend)

        chatView.messageInputTextField.text = ""
    }

}
