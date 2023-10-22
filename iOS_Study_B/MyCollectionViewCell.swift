//
//  MyCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var scrImageView: UIImageView!
    @IBOutlet weak var scrTitle: UILabel!
    @IBOutlet weak var scrPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    public func configure(with model: scrDataset1){
         
        self.scrImageView.image = UIImage(named: model.imageName)
        self.scrTitle.text = model.title
        
        self.scrPrice.text = model.price
        
    }

}
