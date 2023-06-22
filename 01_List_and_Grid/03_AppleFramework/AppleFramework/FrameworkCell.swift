//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by 이재희 on 2023/06/22.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLable.numberOfLines = 1
        nameLable.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLable.text = framework.name
    }
    
}
