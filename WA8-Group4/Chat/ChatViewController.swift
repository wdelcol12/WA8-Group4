import UIKit

struct Message {
    let text: String
    let isSentByCurrentUser: Bool
}

class ChatViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var messages: [Message] = [] // Array to store chat messages

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)

        // Add constraints for collection view
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Add some example messages
        messages.append(Message(text: "Hello!", isSentByCurrentUser: true))
        messages.append(Message(text: "Hi there!", isSentByCurrentUser: false))
        // Add more messages as needed

        // Reload collection view data
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let message = messages[indexPath.item]
        cell.backgroundColor = message.isSentByCurrentUser ? .blue : .darkGray
        let label = UILabel(frame: cell.contentView.bounds)
        label.textAlignment = message.isSentByCurrentUser ? .right : .left
        label.text = message.text
        label.textColor = .white
        label.numberOfLines = 0
        cell.contentView.addSubview(label)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let message = messages[indexPath.item]
        let width = collectionView.bounds.width
        let dummySize = CGSize(width: width * 0.7, height: .greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let estimatedFrame = NSString(string: message.text).boundingRect(with: dummySize, options: options, attributes: attributes, context: nil)
        if (message.isSentByCurrentUser) {
            // cfurrent
            return CGSize(width: width * 0.8, height: estimatedFrame.height + 20)
        } else {
            // other
            return CGSize(width: width, height: estimatedFrame.height + 20)
        }
    }
}
