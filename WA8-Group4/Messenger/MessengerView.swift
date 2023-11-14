//
//  MessengerView.swift
//  WA8-Group4
//
//  Created by Will Del Col on 11/6/23.
//


import UIKit

class MessengerView: UIView {
    
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
        email = UITextField()
        email.font = UIFont.systemFont(ofSize: 20)
        email.placeholder = "Loading..."
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate(
                   [
                        email.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
                        email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
                        
                   ]
       )
    }
}



