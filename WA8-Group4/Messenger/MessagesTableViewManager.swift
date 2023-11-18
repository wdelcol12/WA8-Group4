//
//  MessagesTableViewManager.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

import Foundation
import UIKit

extension MessengerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID, for: indexPath) as! MessagesTableViewCell
        
        let friend = friends[indexPath.row]

        cell.labelName?.text = friend.name
        cell.labelLastMessage?.text = friend.lastMessage
        cell.labelTime?.text = friend.time

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected cell or data
        let selectedChat = self.friends[indexPath.row]
        
        openChatWindow(name: selectedChat.name, email: selectedChat.email)
    }
}
