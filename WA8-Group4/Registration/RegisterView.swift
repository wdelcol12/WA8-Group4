//
//  RegisterView.swift
//  WA8_Group4
//
//  Created by Will Del Col on 11/6/23.
//

import UIKit

class RegisterView: UIView {

    var title: UILabel!
    var name: UITextField!
    var email: UITextField!
    var password: UITextField!
    var btnCreateProfile: UIButton!
    
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
        title.text = "Sign Up to the App"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        name = UITextField()
        name.font = UIFont.systemFont(ofSize: 20)
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
        
        email = UITextField()
        email.font = UIFont.systemFont(ofSize: 20)
        email.placeholder = "Email"
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
        
        btnCreateProfile = UIButton(type: .system)
        btnCreateProfile.setTitle("Create Account", for: .normal)
        btnCreateProfile.tintColor = .systemBlue
        btnCreateProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(btnCreateProfile)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate(
                   [
                        
                        title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
                        title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                        30),
                        title.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                        constant: -30),
                        
                        name.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
                        name.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                        30),
                        name.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                        constant: -30),
                        
                        email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
                        email.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                        30),
                        email.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                        constant: -30),
           
                        password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
                        password.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
                            30),
                        password.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                            constant: -30),
                        
                        btnCreateProfile.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
                        btnCreateProfile.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                        
                   ]
       )
    }

}



