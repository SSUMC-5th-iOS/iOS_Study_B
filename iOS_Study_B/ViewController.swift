//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {

    let testData = Test.data
    let cellName = "TestListCell"
    let cellReuseIdentifier = "testCell"

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
                CustomTableViewCell else {
            return UITableViewCell()
        }

        let target = testData[indexPath.row]

        cell.title.text = target.title
        cell.productImage?.image = UIImage(named: target.image)
        cell.subtitle.text = "\(target.location) · \(target.updateDate)"

        cell.productImage?.layer.cornerRadius = 10
        cell.productImage?.clipsToBounds = true

        return cell
    }

}
