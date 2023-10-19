//
//  WidthCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/19.
//

import UIKit

class WidthCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var widthsub: UILabel!
    @IBOutlet weak var widthtitle: UILabel!
    @IBOutlet weak var widthimageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        widthimageview.layer.cornerRadius = 10
        // Initialization code
    }

}
