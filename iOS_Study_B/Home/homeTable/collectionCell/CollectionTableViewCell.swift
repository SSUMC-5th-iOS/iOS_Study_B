//
//  CollectionTableViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/15.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    @IBOutlet weak var CollectionimageViewProduct: UIImageView!
    @IBOutlet weak var labelCollectionPDName: UILabel!
    @IBOutlet weak var labelCollectionPDPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
