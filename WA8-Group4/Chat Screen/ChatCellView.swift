//
//  ChatCellView.swift
//  WA8-Group4
//
//  Created by Muskaan Nandu on 11/17/23.
//

import UIKit

class ChatCellView: UITableViewCell {

    var wrapperCellView: UIView!
    var message: UILabel!
    var timestamp: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            //self.backgroundColor = .gray
        
        setupWrapperCellView()
        setupMessage()
        setUpTimeStamp()
        
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupMessage(){
        message = UILabel()
        message.font = UIFont.boldSystemFont(ofSize: 22)
        //message.text = msg.text
        message.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(message)
    }
    
    func setUpTimeStamp() {
        timestamp = UILabel()
        timestamp.font = UIFont.systemFont(ofSize: 16)
        timestamp.textColor = .darkGray
        timestamp.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(timestamp)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            message.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            message.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            message.heightAnchor.constraint(equalToConstant: 20),
            message.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor),
            
            timestamp.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 8),
            timestamp.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            timestamp.heightAnchor.constraint(equalToConstant: 20),
            timestamp.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 85)
            
        ])
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
