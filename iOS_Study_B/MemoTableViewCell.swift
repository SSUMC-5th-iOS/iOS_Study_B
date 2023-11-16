//
//  MemoTableViewCell.swift
//  iOS_Study_B
//
//  Created by 임아영 on 11/15/23.
//

import UIKit
import SnapKit

class MemoTableViewCell : UITableViewCell {
    static let identifier = "MemoTableViewCell"
    
    let label : UILabel = {
        let label = UILabel()
        
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
        contentView.addSubview(label)
    
    }
    
    func makeConstraints() {
        label.snp.makeConstraints{ make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).inset(15)
        }
        
    }
}
