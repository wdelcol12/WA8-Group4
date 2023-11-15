//
//  ChatView.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

import UIKit

class ChatView: UIView {

    var labelContactName:UILabel!
    var messageInputTextField:UITextField!
    var sendButton:UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupElements()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupElements(){
        labelContactName = UILabel()
        labelContactName.font = .boldSystemFont(ofSize: 14)
        labelContactName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelContactName)
        
        messageInputTextField = UITextField()
        messageInputTextField.translatesAutoresizingMaskIntoConstraints = false
        messageInputTextField.placeholder = "Type a message..."
        messageInputTextField.borderStyle = .roundedRect
        self.addSubview(messageInputTextField)
        
        sendButton = UIButton(type: .system)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setTitle("Send", for: .normal)
        self.addSubview(sendButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate(
            [
                labelContactName.widthAnchor.constraint(equalToConstant: 32),
                labelContactName.heightAnchor.constraint(equalToConstant: 32),
                labelContactName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
                labelContactName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                messageInputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                messageInputTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
                messageInputTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
                
                sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
                sendButton.widthAnchor.constraint(equalToConstant: 60)
            ]
        )
    }

}
