//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    var tasks: [String] = []
    
    let tableview:UITableView = {
        let table = UITableView()
        table.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        table.backgroundColor = .white
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        navigationItem.title = "메모장"
        setNavigationBar()
    }
    
    func configureSubviews() {
        view.addSubview(tableview)
    }
    
    func makeConstraints() {
        tableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        let MemoViewController = MemoViewController()
          self.navigationController?.pushViewController(MemoViewController, animated: true)
      }
  }

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
        
        cell.label.text = tasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMemo = tasks[indexPath.row]
        let memoViewController = MemoViewController()
        memoViewController.initialMemoContent = selectedMemo
        memoViewController.memoIndex = indexPath.row
        memoViewController.didUpdateMemo = { [weak self] updatedMemo in
            //메모 수정 시 업데이트
            guard let self = self, let index = self.tasks.firstIndex(of: selectedMemo) else { return }
            self.tasks[index] = updatedMemo
            self.tableview.reloadData()
        }
        navigationController?.pushViewController(memoViewController, animated: true)
    }
}


