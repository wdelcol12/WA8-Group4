//
//  Message.swift
//  WA8-Group4
//
//  Created by Bhavik Bhatt on 11/17/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Message: Codable{
    @DocumentID var id: String?
    var recipient: String
    var sender: String
    var text: String
    var timestamp: String
    
    init(recipient: String, sender: String, text: String, timestamp: String) {
        self.recipient = recipient
        self.sender = sender
        self.text = text
        self.timestamp = timestamp
    }
}
