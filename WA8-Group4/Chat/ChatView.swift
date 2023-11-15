//
//  ChatView.swift
//  WA8-Group4
//
//  Created by Muskaan Nandu on 11/10/23.
//

import UIKit

class ChatView: UIView {
    
    var messageLabel: UILabel!
    var bubbleView: UIView!
    
    var messages: [Message] = [] // Array to store chat messages

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
//        setupElements()
//        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
