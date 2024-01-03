//
//  ProfileCollectionViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/29/23.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var addProfileImageview: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 88/2
        addProfileImageview.layer.cornerRadius = 24/2
        
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountLabel, followerCountLabel, followingCountLabel] .forEach{$0.text="\(Int.random(in: 0...10))"}
    }
}
