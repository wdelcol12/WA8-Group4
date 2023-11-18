//
//  DbHelper.swift
//  WA8-Group4
//
//  Created by Bhavik Bhatt on 11/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class DbHelper {
    let database = Firestore.firestore()
    
    func createChatDocumentID(user1: String, user2: String) -> String {
        let combinedString = [user1, user2].sorted().joined(separator: "_")
        return combinedString
    }
    
    func getMessages(chatID: String, completion: @escaping ([Message]?) -> Void) {
        let chatCollection = database.collection("chats").document(chatID).collection("messages").order(by: "timestamp", descending: false)
        var msgArray: [Message] = []
        
        chatCollection.getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil) // Notify completion handler about the error
            } else {
                guard let snapshot = snapshot else {
                    completion(nil)
                    return
                }
                
                for document in snapshot.documents {
                        let message = Message(recipient: document["recipient"] as! String, sender: document["sender"] as! String, text: document["text"] as! String, timestamp: document["timestamp"] as! String)
                        msgArray.append(message)
                        
                   
                }
                
                
                completion(msgArray) // Return the fetched messages via completion handler
            }
        }
    }

    
    func addMessages(chatID: String, senderUser: String, receipentUser: String, textMsg: String) {
        let chatCollection = database.collection("chats")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY HH:mm:ss"

        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        chatCollection.document(chatID).collection("messages").document().setData([
            "sender": senderUser,
            "recipient": receipentUser,
            "text": textMsg,
            "timestamp": formattedDate]){ err in
                if let err = err {
                  print("Error writing document: \(err)")
                } else {
                  print("Document successfully written!")
                }
              }
    }
    
    func addChatIDinUserCollection(senderUser: String, receipentUser: String, chatID: String) {
        let userCollection = database.collection("users")
        
        // Fetch the document to get the current 'chats' array
        userCollection.document(senderUser).getDocument { document, error in
            if let error = error {
                print("Error fetching document: \(error)")
                return
            }

            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }

            // Get the current 'chats' array from the document data
            if var currentChats = document.data()?["chats"] as? [String] {
                // Check if the valueToAdd already exists in the array
                if !currentChats.contains(chatID) {
                    // Append the valueToAdd to the 'chats' array
                    currentChats.append(chatID)
                    
                    // Update the document only if the valueToAdd is not already present
                    userCollection.document(senderUser).updateData(["chats": currentChats]) { error in
                        if let error = error {
                            print("Error updating document: \(error)")
                            return
                        } else {
                            print("Document updated successfully!")
                            return
                        }
                    }
                } else {
                    print("Value already exists in the 'chats' array")
                    return
                }
            } else {
                // 'chats' field does not exist or is not an array
                userCollection.document(senderUser).updateData(["chats": [chatID]]) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                        return
                    } else {
                        print("Document updated successfully!")
                        return
                    }
                }
            }
        }
    }
}
