//
//  LoginView.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//


import UIKit

class LoginView: UIView {

    var title: UILabel!
    var email: UITextField!
    var password: UITextField!
    var btnLogin: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupElements()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupElements() {
        
        title = UILabel()
        title.font = UIFont.systemFont(ofSize: 25)
        title.text = "Login to your Account"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        email = UITextField()
        email.font = UIFont.systemFont(ofSize: 20)
        email.placeholder = "Email"
        email.keyboardType = .emailAddress
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
        
        password = UITextField()
        password.font = UIFont.systemFont(ofSize: 20)
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.borderStyle = .roundedRect
        password.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(password)
        
        btnLogin = UIButton(type: .system)
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.tintColor = .systemBlue
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(btnLogin)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate(
                   [

                        title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
                        title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                        30),
                        title.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                        constant: -30),
                        
                        email.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 50),
                        email.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                        30),
                        email.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                        constant: -30),
                    
                        password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
                        password.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                            30),
                        password.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                            constant: -30),
                        
                        btnLogin.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
                        btnLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                        
                   ]
       )
    }
}


