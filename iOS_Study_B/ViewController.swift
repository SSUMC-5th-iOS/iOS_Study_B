//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//


import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var models = [scrDataset1]()

    let data = DataSet.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(scrDataset1(imageName: "Image 4", title: "하하", price: "1000원"))
        models.append(scrDataset1(imageName: "Image 5", title: "하하", price: "3500원"))
        models.append(scrDataset1(imageName: "Image 6", title: "하하", price: "11000원"))
        models.append(scrDataset1(imageName: "Image 7", title: "하하", price: "1000원"))
        models.append(scrDataset1(imageName: "Image 8", title: "하하", price: "1000원"))
        
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
        tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycell")
        tableView.register(UINib.init(nibName: "FrameTableViewCell", bundle: nil), forCellReuseIdentifier: "FrameTableViewCell")
        
    }
    private let flowLayout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
  //    layout.minimumLineSpacing = 8.0
      layout.minimumInteritemSpacing = 8.0
      layout.itemSize = CGSize(width: 100, height: 100)
      return layout
    }()

}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView : UITableView, heightForRowAt indexPath : IndexPath)->CGFloat{
        if indexPath.row == 2{
            return 280
        }
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FrameTableViewCell", for: indexPath) as! FrameTableViewCell
            cell.configure(with: models)
            return cell
                
        }else{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as?
                    MyTableViewCell else {
                return UITableViewCell()
            }
            
            cell.titleTop.text = data[indexPath.row].text1
            cell.titleBottom.text = data[indexPath.row].text2
            cell.titlePrice.text = data[indexPath.row].text3
            cell.viewImageView.image = UIImage(named: data[indexPath.row].image)
            cell.viewImageView?.layer.cornerRadius = 10
            cell.viewImageView?.clipsToBounds = true
            return cell
        }
        
    }
}
