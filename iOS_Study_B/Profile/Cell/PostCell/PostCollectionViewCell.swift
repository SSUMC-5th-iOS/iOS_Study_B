//
//  PostCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 12/9/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setupData()
    {
        //이미지 뷰 이미지 업로드
    }
}
