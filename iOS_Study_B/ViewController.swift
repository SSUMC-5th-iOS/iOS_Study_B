//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit

struct Memo {
    var title: String
    var content: String
}


class ViewController: UIViewController {

    var memoList = [Memo]()
    
    let myTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        return tableView
    }()
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        super.viewDidLoad()
        configureSubviews()
        makeConstraints()
        setNavigationBar()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        navigationItem.title = "메모장"
    }
    func configureSubviews() {
        view.addSubview(myTableView)
    }
    func makeConstraints() {
        myTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
                navigationItem.rightBarButtonItem = addButton

    }
    @objc func addButtonTapped() {
        let addMemoViewController = AddMemoViewController()
        self.navigationController?.pushViewController(addMemoViewController, animated: true)
    }
    @objc func writeButtonTapped() {
        let addMemoViewController = AddMemoViewController()
        addMemoViewController.memoList = self.memoList
        self.navigationController?.pushViewController(addMemoViewController, animated: true)
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
        let memo = memoList[indexPath.row]
        cell.firstLabel.text = memo.title
        return cell
    }
}

//메모 작성 시 리스트에 반영
//메모 리스트 누르면 메모 보이도록
//밀어서 삭제하는 것 구현
