//
//  ChatView.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

import UIKit

class ChatView: UIView {

    var labelContactName:UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContactName()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContactName(){
        labelContactName = UILabel()
        labelContactName.font = .boldSystemFont(ofSize: 14)
        labelContactName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelContactName)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate(
            [
                labelContactName.widthAnchor.constraint(equalToConstant: 32),
                labelContactName.heightAnchor.constraint(equalToConstant: 32),
                labelContactName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
                labelContactName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
            ]
        )
    }

}
