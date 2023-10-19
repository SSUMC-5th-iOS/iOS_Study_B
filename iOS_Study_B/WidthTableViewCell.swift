//
//  WidthTableViewCell.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/19.
//

import UIKit

class WidthTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = [String]()
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           collectionView.collectionViewLayout = layout
           
           collectionView.delegate = self
           collectionView.dataSource = self
           
           collectionView.register(UINib(nibName: "WidthCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WidthCollectionViewCell")
           // Initialization code
       }
       
       

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }
       
   }

extension WidthTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return 4}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WidthCollectionViewCell", for: indexPath) as? WidthCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            //1. 사진 교체
            cell.widthimageview.image = UIImage(named:"8")
            //2. 상품명 교체
            cell.widthtitle.text = "곰돌이 모양 틀 얼음 판매, 새 것"
            //3. 상품 가격 교체
            cell.widthsub.text = "3,000원"
        }
        if indexPath.row == 1 {
            //1. 사진 교체
            cell.widthimageview.image = UIImage(named:"3")
            //2. 상품명 교체
            cell.widthtitle.text = "키친플라워 DW1201CP 얼음 제빙기"
            //3. 상품 가격 교체
            cell.widthsub.text = "62,000원"
        }
        if indexPath.row == 2 {
            //1. 사진 교체
            cell.widthimageview.image = UIImage(named:"5")
            //2. 상품명 교체
            cell.widthtitle.text = "얼음트레이 소(얼음판)/개당 판매 가능합니다!"
            //3. 상품 가격 교체
            cell.widthsub.text = "1,000원"
        }
        if indexPath.row == 3 {
            //1. 사진 교체
            cell.widthimageview.image = UIImage(named:"9")
            //2. 상품명 교체
            cell.widthtitle.text = "실리콘얼음틀"
            //3. 상품 가격 교체
            cell.widthsub.text = "2,000원"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 138, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
}
