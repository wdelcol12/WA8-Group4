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
        cell.labelName.text = friends[indexPath.row]
        cell.labelLastMessage.text = friends[indexPath.row]
        cell.labelTime.text = (friends[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected cell or data
        let selectedChat = self.friends[indexPath.row]

        openChatWindow(name: selectedChat)
    }
}
