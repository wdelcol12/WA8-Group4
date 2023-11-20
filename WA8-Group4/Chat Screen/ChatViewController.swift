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
    var msgArray = [Message]()
    
    override func loadView() {
        view = chatView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedFriendName
        
        chatView.sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        chatView.contentWrapper.dataSource = self
        chatView.contentWrapper.delegate = self
        
        chatView.contentWrapper.separatorStyle = .none
        loadMessages()
        
    }
    
    @objc func loadMessages() {
        let senderUser = UserDefaults.standard.string(forKey: "userToken")
        let receipentUser = selectedFriendEmail
        
        let chatID = helperObj.createChatDocumentID(user1: senderUser!, user2: receipentUser!)
        self.msgArray.removeAll()
        
        self.database.collection("chats")
            .document(chatID)
            .collection("messages")
            .order(by:"timestamp", descending: false)
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                
                if let documents = querySnapshot?.documents{
                    
                    
                    self.msgArray.removeAll()
                    for document in documents{
                        do {
                            let msg = try document.data(as: Message.self)
                            self.msgArray.append(msg)
                            
                        }catch {
                            print(error)
                        }
                    }
                }
                self.chatView.contentWrapper.reloadData()
                self.scrollToBottom()
            }
            )
//        helperObj.getMessages(chatID: chatID) { (messages) in
//            if let messageArray = messages {
//                for msg in messageArray {
//                    self.msgArray.append(msg)
//                }
//                
//                self.chatView.contentWrapper.reloadData()
//                self.scrollToBottom()
//            }
//        }
    }
    
    @objc func scrollToBottom() {
        let numberOfsections = chatView.contentWrapper.numberOfSections
        let numberOfRows = chatView.contentWrapper.numberOfRows(inSection: numberOfsections - 1)
        
        if numberOfRows > 0 {
            let indexPath = IndexPath(row: numberOfRows - 1, section: numberOfsections - 1)
            chatView.contentWrapper.scrollToRow(at: indexPath, at: .bottom, animated: true)
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
        
//        chatView.contentWrapper.reloadData()
        loadMessages()
    }

}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chats", for: indexPath) as! ChatCellView
        let msg = msgArray[indexPath.row]
        //cell.setupMessage(with: msg)
        if(msg.sender == UserDefaults.standard.string(forKey: "userToken")) {
            cell.message.textAlignment = .right
            cell.timestamp.textAlignment = .right
            cell.message.textColor = .blue
        } else {
            cell.message.textAlignment = .left
            cell.timestamp.textAlignment = .left
            cell.message.textColor = .red
        }
        cell.message.text = msg.text
        cell.timestamp.text = msg.timestamp
        return cell
    }
}

