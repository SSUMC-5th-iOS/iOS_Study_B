//
//  StoryCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/15.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewimageViewBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewimageViewBackground.layer.cornerRadius=24
        viewUserProfileBackground.layer.cornerRadius=23.5
        imageViewUserProfile.layer.cornerRadius=22.5
        imageViewUserProfile.clipsToBounds = true
        
        // Initialization code
    }

}
