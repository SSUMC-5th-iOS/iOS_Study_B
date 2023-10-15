//
//  HomeTableViewController.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/12.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var PDtableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PDtableView.delegate = self
        PDtableView.dataSource = self
        let feedNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        PDtableView.register(feedNib, forCellReuseIdentifier: "HomeTableViewCell ")
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as?
                HomeTableViewCell else {
            return HomeTableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
