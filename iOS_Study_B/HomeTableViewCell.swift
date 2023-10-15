//
//  HomeTableViewCell.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/12.
//

import UIKit 

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var DGalbaimage: UIImageView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var sub1: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let fontSize = UIFont.systemFontSize
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
           // Cell 간격 조정
       contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
     }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

