//
//  MemoTableViewCell.swift
//  TableView
//
//  Created by 황채웅 on 2023/11/15.
//

import UIKit
import SnapKit

class MemoTableViewCell : UITableViewCell {
    static let identifier = "MemoTableViewCell"
    
    let firstLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        makeConstraints()
    }
    func configureSubviews() {
        contentView.addSubview(firstLabel)
    }
    func makeConstraints() {
        firstLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).inset(15)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
