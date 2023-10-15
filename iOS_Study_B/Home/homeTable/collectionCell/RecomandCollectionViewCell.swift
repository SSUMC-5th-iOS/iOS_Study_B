//
//  RecomandCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/15.
//

import UIKit

class RecomandCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var RecomandCollectionViewImg: UIImageView!
    @IBOutlet weak var RecomandCollectoinViewTitle: UILabel!
    @IBOutlet weak var RecomandCollectionViewPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        RecomandCollectionViewImg.layer.cornerRadius = 10
        RecomandCollectionViewImg.clipsToBounds = true
    }
        

}
