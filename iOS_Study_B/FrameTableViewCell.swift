//
//  FrameTableViewCell.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/22.
//

import UIKit

class FrameTableViewCell: UITableViewCell{
    
    func configure(with models: [scrDataset1]){
        self.models = models
        collectionView.reloadData()
    }
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var models = [scrDataset1]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "scrcell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension FrameTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count //model의 수 만큼 cell개수 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let scrcell = collectionView.dequeueReusableCell(withReuseIdentifier: "scrcell", for: indexPath) as! MyCollectionViewCell
        scrcell.configure(with: models[indexPath.row])
        return scrcell
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize { //cell의 크기 설정
//        return CGSize(width: 128, height: 128)
//    }
//    
}
