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
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
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
        // contentInset 고려
        let padding: CGFloat = 16
        
        // 셀의 너비와 높이 설정
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        
        // 과제 : 한 라인에 셀 두 칸으로 만들어보기
        //let width = (collectionView.bounds.width - interItemSpacing - padding * 2) / 2
        // 과제 : 한 라인에 셀 네 칸으로 만들어보기
        //let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 4
        
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

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
