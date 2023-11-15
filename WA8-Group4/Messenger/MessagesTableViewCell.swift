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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelLastMessage()
        setupLabelTime()
        
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
        wrapperCellView.layer.shadowRadius = 2.0
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
            
            wrapperCellView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            wrapperCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            wrapperCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            labelName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            
            labelLastMessage.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelLastMessage.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelLastMessage.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),

            labelTime.topAnchor.constraint(equalTo: labelLastMessage.bottomAnchor, constant: 4),
            labelTime.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            labelTime.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -8),
            wrapperCellView.heightAnchor.constraint(equalToConstant: 82)
            
            
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
