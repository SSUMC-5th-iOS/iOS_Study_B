//
//  ProductTableViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/12.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var labelPDName: UILabel!
    @IBOutlet weak var labelPDlocation: UILabel!
    @IBOutlet weak var buttonCurrentPD: UIButton!
    @IBOutlet weak var labelPDPrice: UILabel!
    @IBOutlet weak var buttonIsChat: UIButton!
    @IBOutlet weak var labelChatNumber: UILabel!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var labelHeartNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewProduct.layer.cornerRadius = 10
        imageViewProduct.clipsToBounds = true
        buttonCurrentPD.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
