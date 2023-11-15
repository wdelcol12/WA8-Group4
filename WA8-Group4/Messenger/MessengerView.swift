//
//  MessengerView.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//


import UIKit

class MessengerView: UIView {
    
    var labelLoggedInName: UILabel!
    var btnLogin: UIButton!
    var tableViewMessages: UITableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLoggedInName()
        setupTableViewContacts()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoggedInName(){
        labelLoggedInName = UILabel()
        labelLoggedInName.font = .boldSystemFont(ofSize: 14)
        labelLoggedInName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLoggedInName)
    }
    
    func setupTableViewContacts(){
        tableViewMessages = UITableView()
        tableViewMessages.register(MessagesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID)
        tableViewMessages.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewMessages)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate(
            [
                labelLoggedInName.widthAnchor.constraint(equalToConstant: 32),
                labelLoggedInName.heightAnchor.constraint(equalToConstant: 32),
                labelLoggedInName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
                labelLoggedInName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                tableViewMessages.topAnchor.constraint(equalTo: labelLoggedInName.bottomAnchor, constant: 8),
                tableViewMessages.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
                tableViewMessages.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                tableViewMessages.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ]
        )
    }
    
}



