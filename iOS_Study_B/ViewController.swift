//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let HomeNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(HomeNib, forCellReuseIdentifier: "HomeTableViewCell")
        let WidthNib = UINib(nibName: "WidthTableViewCell", bundle: nil)
        tableView.register(WidthNib, forCellReuseIdentifier: "WidthTableViewCell")
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
                   guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
                       return UITableViewCell()
                   }
                   //1.사진 교체
                   cell.imageview.image = UIImage(named: "1")
                   //2.상품이름 교체
                   cell.title.text = "에어팟맥스 [S급] 스페이스 그래이 최상\n급상태 팝니다~!!"
                   //3.상품판매 위치 교체
                   cell.sub.text = "당근알바﹒이벤트"
                   cell.subimage.isHidden = true
                   cell.price.isHidden = true

            return cell
                    }
        else if indexPath.row == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WidthTableViewCell", for: indexPath) as? WidthTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            //1.사진 교체
            cell.imageview.image = UIImage(named: "4")
            //2.상품이름 교체
            cell.title.text = "에어팟맥스 실버(미개봉)"
            //3.상품판매 위치 교체
            cell.sub.text = "서울특별시 구로구﹒5시간 전"
            cell.subimage.image = UIImage(named: "7")
            cell.price.text = "600,000원"
            return cell
             }
        if indexPath.row == 3 {
                   guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
                       return UITableViewCell()
                   }
                   //1.사진 교체
                   cell.imageview.image = UIImage(named: "6")
                   //2.상품이름 교체
                   cell.title.text = "메가하이볼!!"
                   //3.상품판매 위치 교체
                   cell.sub.text = "광명동﹒추천소식"
                   cell.subimage.isHidden = true
                   cell.price.isHidden = true

            return cell
                    }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
      
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 {
            return 170
        } else {
            return 150
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? WidthTableViewCell else {
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}


extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WidthCollectionViewCell", for: indexPath) as? WidthCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
}
