//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var memos = [MemoInformation]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)
        
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "메모장"
        setNavigationBar()
        
    }
    
    func configureSubviews() {
        view.addSubview(tableView)
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //네비게이션 바 "+" 버튼
    func setNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    //"+" 버튼 눌렀을때 동작
    @objc func addButtonTapped() {
        let addMemoViewController = AddMemoViewController()
        self.navigationController?.pushViewController(addMemoViewController, animated: true)
    }
    
    func addMemo(_ memo: MemoInformation) {
        memos.append(memo)
        tableView.reloadData()
    }
    
    // tableView 삭제 동작
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            
            self.memos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // tableView 상세 정보 창 넘어가기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailMemoViewController = DetailMemoViewController()
        
        detailMemoViewController.memo = memos[indexPath.row]
        detailMemoViewController.index = indexPath.row
        detailMemoViewController.delegate = self
        
        self.navigationController?.pushViewController(detailMemoViewController, animated: true)
    }
}


//테이블 뷰에 테이블 뷰 셀 넣기
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
            return 80
        }
}

//memo 데이터 전달
extension MainViewController: EditMemoDelegate {
    func didUpdateMemo(_ memo: MemoInformation, atIndex index: Int) {
            memos[index] = memo
            tableView.reloadData()
        }
}
