//
//  MyTableViewCell.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/18.
//

import UIKit

class MyTableViewCell: UITableViewCell{
    
    @IBOutlet weak var viewImageView: UIImageView!
    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var titleBottom: UILabel!
    @IBOutlet weak var titlePrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
