//
//  HomeTableViewCell.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/19.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var subimage: UIImageView!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var sub: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
