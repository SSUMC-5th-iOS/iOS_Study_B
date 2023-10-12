//
//  HomeViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/11.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let productNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(productNib, forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {return 4}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
                       return UITableViewCell()
                   }
                   cell.selectionStyle = .none
                   
                   if indexPath.row == 0 {
                       //1.사진 교체
                       cell.imageViewProduct.image = UIImage(named: "스크린샷 2023-10-11 오전 1.35.33")
                       //2.상품이름 교체
                       cell.labelPDName.text = "[급구] 50만원 제공! 쿵야 레스토랑\n에서 시식 알바 구함니다. ^^-🧅"
                       //3.상품판매 위치 교체
                       cell.labelPDlocation.text = "당근알바﹒이벤트"
                       //4.현재 상태 숨기기
                       cell.buttonCurrentPD.isHidden = true
                       //5.상품가격 숨기기
                       cell.labelPDPrice.isHidden = true
                       //6.채팅, 채팅 수 숨기기
                       cell.buttonIsChat.isHidden = true
                       cell.labelChatNumber.isHidden = true
                       //7.하트, 하트 수 숨기기
                       cell.buttonIsHeart.isHidden = true
                       cell.labelHeartNumber.isHidden = true
                       
                   } else if indexPath.row == 2 {
                       //1.사진 교체
                       cell.imageViewProduct.image = UIImage(named: "스크린샷 2023-10-11 오전 1.35.47")
                       //2.상품이름 교체
                       cell.labelPDName.text = "에어팟 맥스 스페이스그레이 S급\n판매합니다."
                       //3.상품판매 위치 교체
                       cell.labelPDlocation.text = "서울특별시 양천구﹒3시간전"
                       //4.현재 상태 삭제
                       cell.buttonCurrentPD.removeFromSuperview()
                       //5.상품가격 교체
                       cell.labelPDPrice.text = "490,000원"
                       //6.채팅 수 교체
                       cell.labelChatNumber.text = "1"
                       //7.하트 수 교체
                       cell.labelHeartNumber.text = "4"
                       //8. 상품가격 위치 이동
                       cell.labelPDPrice.translatesAutoresizingMaskIntoConstraints = false
                       cell.contentView.addSubview(cell.labelPDPrice)

                       if let labelPDPrice = cell.labelPDPrice {
                           let leadingConstraint = NSLayoutConstraint(item: labelPDPrice, attribute: .leading, relatedBy: .equal, toItem: cell.labelPDName, attribute: .leading, multiplier: 1.0, constant: 5)
                           let topConstraint = NSLayoutConstraint(item: labelPDPrice, attribute: .top, relatedBy: .equal, toItem: cell.labelPDlocation, attribute: .bottom, multiplier: 1.0, constant: 5)
                           
                           cell.contentView.addConstraints([leadingConstraint, topConstraint])
                       }
                       
                       
                   } else if indexPath.row == 3 {
                       //1.사진 교체
                       cell.imageViewProduct.image = UIImage(named: "스크린샷 2023-10-11 오전 1.35.55")
                       //2.상품이름 교체
                       cell.labelPDName.text = "[S급]에어팟 맥스 스페이스 그레이\n풀박 판매합니다."
                       //3.상품판매 위치 교체
                       cell.labelPDlocation.text = "서울특별시 양천구﹒1일전"
                       //4.현재 상태 삭제
                       cell.buttonCurrentPD.removeFromSuperview()
                       //5.상품가격 교체
                       cell.labelPDPrice.text = "550,000원"
                       //6.채팅 수 교체
                       cell.labelChatNumber.text = "1"
                       //7.하트 수 교체
                       cell.labelHeartNumber.text = "7"
                       //8. 상품가격 위치 이동
                       cell.labelPDPrice.translatesAutoresizingMaskIntoConstraints = false
                       cell.contentView.addSubview(cell.labelPDPrice)

                       if let labelPDPrice = cell.labelPDPrice {
                           let leadingConstraint = NSLayoutConstraint(item: labelPDPrice, attribute: .leading, relatedBy: .equal, toItem: cell.labelPDName, attribute: .leading, multiplier: 1.0, constant: 5)
                           let topConstraint = NSLayoutConstraint(item: labelPDPrice, attribute: .top, relatedBy: .equal, toItem: cell.labelPDlocation, attribute: .bottom, multiplier: 1.0, constant: 5)
                           
                           cell.contentView.addConstraints([leadingConstraint, topConstraint])
                       }
                       
                   }
                   
                   return cell
               }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
}

