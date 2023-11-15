//
//  MessagesTableViewCell.swift
//  WA8-Group4
//
//  Created by Rishabh Raj on 13/11/23.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelLastMessage: UILabel!
    var labelTime: UILabel!
    var labelEmail: UILabel! //remove

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelLastMessage()
        setupLabelTime()
        setupLabelEmail() //remove
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.font = UIFont.boldSystemFont(ofSize: 20)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    
    func setupLabelLastMessage(){
        labelLastMessage = UILabel()
        labelLastMessage.font = UIFont.boldSystemFont(ofSize: 14)
        labelLastMessage.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelLastMessage)
    }
    
    func setupLabelTime(){
        labelTime = UILabel()
        labelTime.font = UIFont.boldSystemFont(ofSize: 14)
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTime)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelLastMessage.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
            labelLastMessage.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelLastMessage.heightAnchor.constraint(equalToConstant: 16),
            labelLastMessage.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
//            labelTime.topAnchor.constraint(equalTo: labelLastMessage.bottomAnchor, constant: 2),
//            labelTime.leadingAnchor.constraint(equalTo: labelLastMessage.leadingAnchor),
//            labelTime.heightAnchor.constraint(equalToConstant: 16),
//            labelTime.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelLastMessage.bottomAnchor, constant: 2),
            labelEmail.leadingAnchor.constraint(equalTo: labelLastMessage.leadingAnchor),
            labelEmail.heightAnchor.constraint(equalToConstant: 16),
            labelEmail.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}