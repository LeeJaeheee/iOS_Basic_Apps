//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 이재희 on 2023/06/20.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // 과제 1: 채팅 리스트 날짜 최신순으로 정렬
    let chatList: [Chat] = Chat.list.sorted(by: {$0.date > $1.date})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}

extension ChatListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
    
    
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
