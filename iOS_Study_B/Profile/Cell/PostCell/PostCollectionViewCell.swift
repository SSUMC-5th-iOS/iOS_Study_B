//
//  PostCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/29/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setupData() {
        //이미지뷰의 이미지를 업로드한다. 
    }

}
