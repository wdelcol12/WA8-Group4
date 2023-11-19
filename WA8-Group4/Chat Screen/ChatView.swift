//
//  ChatView.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

//import UIKit
//
//enum MessageType {
//    case sent
//    case received
//}
//
//struct ChatMessage {
//    let text: String
//    let type: MessageType
//}
//
//class ChatView: UIView {
//    var contentWrapper:UIScrollView!
//    var textField1:UITextField!
//    var textField2:UITextField!
//    var textField3:UITextField!
//    var textField4:UITextField!
//    var textField5:UITextField!
//    var textField6:UITextField!
//    var textField7:UITextField!
//    var textField8:UITextField!
//    var textField9:UITextField!
//    var textField10:UITextField!
//    var textField11:UITextField!
//    var textField12:UITextField!
//    var textField13:UITextField!
//    var textField14:UITextField!
//    var textField15:UITextField!
//    var textField16:UITextField!
//    var textField17:UITextField!
//    var textField18:UITextField!
//    var textField19:UITextField!
//    var textField20:UITextField!
//    var textField21:UITextField!
//    var textField22:UITextField!
//    var textField23:UITextField!
//    var textField24:UITextField!
//    var textField25:UITextField!
//    
//    var messageInputTextField:UITextField!
//    var sendButton:UIButton!
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        
//        setupContentWrapper()
//        setuptextField1()
//        setuptextField2()
//        setuptextField3()
//        setupElements()
//        
//        initConstraints()
//    }
//    
//    //MARK: unused...
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: setting up UI elements...
//    func setupContentWrapper(){
//        contentWrapper = UIScrollView()
//        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(contentWrapper)
//    }
//
//    func setuptextField1(){
//        textField1 = UITextField()
//        textField1.placeholder = "First Text Field"
//        textField1.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField1)
//    }
//    
//    func setuptextField2(){
//        textField2 = UITextField()
//        textField2.placeholder = "Second Text Field"
//        textField2.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField2)
//        
//        textField4 = UITextField()
//        textField4.placeholder = "4 Text Field"
//        textField4.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField4)
//        
//        textField5 = UITextField()
//        textField5.placeholder = "5 Text Field"
//        textField5.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField5)
//        
//        textField6 = UITextField()
//        textField6.placeholder = "6 Text Field"
//        textField6.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField6)
//        
//        textField7 = UITextField()
//        textField7.placeholder = "7 Text Field"
//        textField7.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField7)
//        
//        textField8 = UITextField()
//        textField8.placeholder = "8 Text Field"
//        textField8.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField8)
//        
//        textField9 = UITextField()
//        textField9.placeholder = "9 Text Field"
//        textField9.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField9)
//        
//        textField10 = UITextField()
//        textField10.placeholder = "10 Text Field"
//        textField10.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField10)
//        
//        textField11 = UITextField()
//        textField11.placeholder = "11 Text Field"
//        textField11.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField11)
//        
//        textField12 = UITextField()
//        textField12.placeholder = "12 Text Field"
//        textField12.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField12)
//        
//        textField13 = UITextField()
//        textField13.placeholder = "13 Text Field"
//        textField13.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField13)
//        
//        textField14 = UITextField()
//        textField14.placeholder = "14 Text Field"
//        textField14.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField14)
//        
//        textField15 = UITextField()
//        textField15.placeholder = "15 Text Field"
//        textField15.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField15)
//        
//        textField16 = UITextField()
//        textField16.placeholder = "16 Text Field"
//        textField16.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField16)
//        
//        textField17 = UITextField()
//        textField17.placeholder = "17 Text Field"
//        textField17.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField17)
//        
//        textField18 = UITextField()
//        textField18.placeholder = "18 Text Field"
//        textField18.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField18)
//        
//        textField19 = UITextField()
//        textField19.placeholder = "19 Text Field"
//        textField19.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField19)
//        
//        textField20 = UITextField()
//        textField20.placeholder = "20 Text Field"
//        textField20.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField20)
//        
//        textField21 = UITextField()
//        textField21.placeholder = "21 Text Field"
//        textField21.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField21)
//        
//        textField22 = UITextField()
//        textField22.placeholder = "22 Text Field"
//        textField22.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField22)
//        
//        textField23 = UITextField()
//        textField23.placeholder = "23 Text Field"
//        textField23.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField23)
//        
//        textField24 = UITextField()
//        textField24.placeholder = "24 Text Field"
//        textField24.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField24)
//        
//        textField25 = UITextField()
//        textField25.placeholder = "25 Text Field"
//        textField25.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField25)
//    }
//
//    func setuptextField3(){
//        textField3 = UITextField()
//        textField3.placeholder = "Third Text Field"
//        textField3.translatesAutoresizingMaskIntoConstraints = false
//        contentWrapper.addSubview(textField3)
//    }
//    
//    func setupElements() {
//        messageInputTextField = UITextField()
//        messageInputTextField.translatesAutoresizingMaskIntoConstraints = false
//        messageInputTextField.placeholder = "Type a message..."
//        messageInputTextField.borderStyle = .roundedRect
//        self.addSubview(messageInputTextField)
//
//        sendButton = UIButton(type: .system)
//        sendButton.translatesAutoresizingMaskIntoConstraints = false
//        sendButton.setTitle("Send", for: .normal)
//        self.addSubview(sendButton)
//    }
//    
//    //MARK: initializing constraints...
//    func initConstraints(){
//        NSLayoutConstraint.activate([
//            //MARK: contentWrapper constraints...
//            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
//            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
//            
//            //MARK: textField1 constraints...
//            textField1.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
//            textField1.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            //MARK: textField2 constraints...
//            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 8),
//            textField2.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            //MARK: textField3 constraints...
//            textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 8),
//            textField3.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField4.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 8),
//            textField4.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField5.topAnchor.constraint(equalTo: textField4.bottomAnchor, constant: 8),
//            textField5.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField6.topAnchor.constraint(equalTo: textField5.bottomAnchor, constant: 8),
//            textField6.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField7.topAnchor.constraint(equalTo: textField6.bottomAnchor, constant: 8),
//            textField7.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField8.topAnchor.constraint(equalTo: textField7.bottomAnchor, constant: 8),
//            textField8.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField9.topAnchor.constraint(equalTo: textField8.bottomAnchor, constant: 8),
//            textField9.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField10.topAnchor.constraint(equalTo: textField9.bottomAnchor, constant: 8),
//            textField10.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField11.topAnchor.constraint(equalTo: textField10.bottomAnchor, constant: 8),
//            textField11.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            //MARK: textField3 constraints...
//            textField12.topAnchor.constraint(equalTo: textField11.bottomAnchor, constant: 8),
//            textField12.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField13.topAnchor.constraint(equalTo: textField12.bottomAnchor, constant: 8),
//            textField13.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField14.topAnchor.constraint(equalTo: textField13.bottomAnchor, constant: 8),
//            textField14.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField15.topAnchor.constraint(equalTo: textField14.bottomAnchor, constant: 8),
//            textField15.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField16.topAnchor.constraint(equalTo: textField15.bottomAnchor, constant: 8),
//            textField16.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField17.topAnchor.constraint(equalTo: textField16.bottomAnchor, constant: 8),
//            textField17.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField18.topAnchor.constraint(equalTo: textField17.bottomAnchor, constant: 8),
//            textField18.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField19.topAnchor.constraint(equalTo: textField18.bottomAnchor, constant: 8),
//            textField19.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField20.topAnchor.constraint(equalTo: textField19.bottomAnchor, constant: 8),
//            textField20.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField21.topAnchor.constraint(equalTo: textField20.bottomAnchor, constant: 8),
//            textField21.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//        
//            textField22.topAnchor.constraint(equalTo: textField21.bottomAnchor, constant: 8),
//            textField22.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField23.topAnchor.constraint(equalTo: textField22.bottomAnchor, constant: 8),
//            textField23.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField24.topAnchor.constraint(equalTo: textField23.bottomAnchor, constant: 8),
//            textField24.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            
//            textField25.topAnchor.constraint(equalTo: textField24.bottomAnchor, constant: 8),
//            textField25.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            textField25.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
//            
//            messageInputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            messageInputTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
//            messageInputTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
//            
//            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
//            sendButton.widthAnchor.constraint(equalToConstant: 60)
//
//        ])
//    }
//}

import UIKit

class ChatView: UIView {
    var contentWrapper:UITableView!
    var messageInputTextField:UITextField!
    var sendButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupContentWrapper()
        setupElements()
        
        initConstraints()
    }
    
    //MARK: unused...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: setting up UI elements...
    func setupContentWrapper(){
        contentWrapper = UITableView()
        //contentWrapper.backgroundColor = .white
        contentWrapper.register(ChatCellView.self, forCellReuseIdentifier: "chats")
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.estimatedRowHeight = 100
        contentWrapper.rowHeight = UITableView.automaticDimension
        self.addSubview(contentWrapper)
    }
    
    func setupElements() {
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
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            contentWrapper.bottomAnchor.constraint(equalTo: messageInputTextField.topAnchor, constant: -8),
            
            messageInputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            messageInputTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            messageInputTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8),
            
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            sendButton.widthAnchor.constraint(equalToConstant: 60)

        ])
    }
}
