//
//  Friends.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Friend: Codable{
    @DocumentID var id: String?
    var name: String
    var lastMessage: String
    var time: String
    var email: String
    
    init(name: String, lastMessage: String, time: String, email: String) {
        self.name = name
        self.lastMessage = lastMessage
        self.time = time
        self.email = email
    }
}
