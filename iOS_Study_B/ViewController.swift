//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    var memos = [Memo]()
    
    let tableview:UITableView = {
        let table = UITableView()
        table.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        table.backgroundColor = .white
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        makeConstraints()
        setNavigationBar()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.title = "메모장"
        navigationItem.rightBarButtonItem = addButton
    }
    
    func configureSubviews() {
        view.addSubview(tableview)
    }
    
    func makeConstraints() {
        tableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func addButtonTapped() {
        let addMemoViewController = MemoViewController()
        self.navigationController?.pushViewController(addMemoViewController, animated: true)
    }
    
    func addMemo(_ memo: Memo) {
        memos.append(memo)
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in

                self.memos.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                completionHandler(true)
            }

            return UISwipeActionsConfiguration(actions: [deleteAction])
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailMemoViewController = MemoDetailViewController()

            detailMemoViewController.memo = memos[indexPath.row]
            detailMemoViewController.index = indexPath.row
            detailMemoViewController.delegate = self

            self.navigationController?.pushViewController(detailMemoViewController, animated: true)
        }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
        
        let memo = memos[indexPath.row]
        cell.configure(with: memo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ViewController: MemoEditDelegate {
    func didUpdateMemo(_ memo: Memo, atIndex index: Int) {
        memos[index] = memo
        tableview.reloadData()
    }
}
