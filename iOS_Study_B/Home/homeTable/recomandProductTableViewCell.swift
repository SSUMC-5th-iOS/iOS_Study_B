//
//  recomandProductTableViewCell.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/15.
//

import UIKit

class recomandProductTableViewCell:UITableViewCell {
    
    @IBOutlet weak var labelCollectionTitle: UILabel!
    @IBOutlet weak var buttonLookCollection: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var RecomandCollectionView: UICollectionView!
    
    var model = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        RecomandCollectionView.collectionViewLayout = layout
        
        RecomandCollectionView.delegate = self
        RecomandCollectionView.dataSource = self
        
        RecomandCollectionView.register(UINib(nibName: "RecomandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecomandCollectionViewCell")
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension recomandProductTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return 4}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = RecomandCollectionView.dequeueReusableCell(withReuseIdentifier: "RecomandCollectionViewCell", for: indexPath) as? RecomandCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            //1. 사진 교체
            cell.RecomandCollectionViewImg.image = UIImage(named:"스크린샷 2023-10-15 오전 12.54.46")
            //2. 상품명 교체
            cell.RecomandCollectoinViewTitle.text = "곰돌이 모양 틀 얼음 판매, 새 것"
            //3. 상품 가격 교체
            cell.RecomandCollectionViewPrice.text = "3,000원"
        }
        if indexPath.row == 2 {
            //1. 사진 교체
            cell.RecomandCollectionViewImg.image = UIImage(named:"스크린샷 2023-10-15 오전 12.52.59")
            //2. 상품명 교체
            cell.RecomandCollectoinViewTitle.text = "얼음 트레이 소 (얼음판)/개당 판매합니다."
            //3. 상품 가격 교체
            cell.RecomandCollectionViewPrice.text = "1,000원"
        }
        if indexPath.row == 3 {
            //1. 사진 교체
            cell.RecomandCollectionViewImg.image = UIImage(named:"스크린샷 2023-10-15 오전 12.54.01")
            //2. 상품명 교체
            cell.RecomandCollectoinViewTitle.text = "실리콘얼음틀"
            //3. 상품 가격 교체
            cell.RecomandCollectionViewPrice.text = "2,000원"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 138, height: 233)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
}
