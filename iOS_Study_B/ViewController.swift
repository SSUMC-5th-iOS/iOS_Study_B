//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//


import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = DataSet.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
        tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycell")
    }
    


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView : UITableView, heightForRowAt indexPath : IndexPath)->CGFloat{
            return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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

