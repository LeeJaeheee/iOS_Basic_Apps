//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 이재희 on 2023/06/14.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // UIComponent 연결
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    // UIComponent 데이터 업데이트
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(stock.price)) 원"
        diffLabel.text = "\(stock.diff)%"
        diffLabel.textColor = stock.diff >= 0 ? UIColor.systemRed : UIColor.systemBlue
    }
    
    func convertToCurrencyFormat(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
}
