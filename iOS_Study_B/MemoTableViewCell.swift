//
//  MemoTableViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/15/23.
//

import UIKit
import SnapKit

class MemoTableViewCell: UITableViewCell {
    static let identifier = "MemoTableViewCell"
    
    let TitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        
        return label
    }()
    let ContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           configureSubviews()
           makeConstraints()
       }
       
    override func awakeFromNib() {
           super.awakeFromNib()
       }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func configureSubviews() {
        contentView.addSubview(TitleLabel)
        contentView.addSubview(ContentLabel)
    }
    func makeConstraints() {
        TitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView).inset(15)
        }
                
        ContentLabel.snp.makeConstraints { make in
            make.top.equalTo(TitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView).inset(15)
        }
    }
    func configure(with memo: MemoInformation) {
            TitleLabel.text = memo.title
            ContentLabel.text = memo.content
        }
}
