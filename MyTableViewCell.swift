//
//  MyTableViewCell.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/30.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var pizzaSize: UILabel!
    @IBOutlet weak var pizzaDough: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
