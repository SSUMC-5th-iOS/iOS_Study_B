//
//  FeedTableViewCell.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/27.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var imageviewmyprofile: UIImageView!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var labelHowmanylikes: UILabel!
    @IBOutlet weak var buttonisBookmark: NSLayoutConstraint!
    @IBOutlet weak var buttonisHeart: UIButton!
    @IBOutlet weak var imageviewFeed: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var imageviewUserprofile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageviewmyprofile.layer.cornerRadius = 22.5
        imageviewmyprofile.clipsToBounds = true
        imageviewUserprofile.layer.cornerRadius = 22.5
        imageviewUserprofile.clipsToBounds = true
        
        let fontsize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? ""  )
        attributedStr.addAttribute(.font, value: fontsize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributedStr
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
