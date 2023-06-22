//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by 이재희 on 2023/06/22.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
}

extension FrameworkListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
    
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    
    // CollectionView의 Estimate size : Automatic -> None으로 변경 -> 사이즈는 아래 함수만 참고하도록 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 셀 사이 수평 간격
        let interItemSpacing: CGFloat = 10
        
        // 셀의 너비와 높이 설정
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    // 셀 사이 수평 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // 라인 사이 수직 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
