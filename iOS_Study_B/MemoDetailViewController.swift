//
//  MemoDetailViewController.swift
//  iOS_Study_B
//
//  Created by 임아영 on 11/17/23.
//

protocol MemoEditDelegate: AnyObject {
 func didUpdateMemo(_ memo: Memo, atIndex: Int)
}

extension MemoDetailViewController: MemoEditDelegate {
    func didUpdateMemo(_ memo: Memo, atIndex: Int) {
    }
}


import UIKit
import SnapKit

class MemoDetailViewController: UIViewController {
    
    var memo: Memo?
    var index: Int?
    weak var delegate: MemoEditDelegate?
    
    let Label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let Label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "메모 상세"
        
        configureSubviews()
        makeConstraints()
        setNavigationBar()
        
        if let memo = memo {
            displayMemo(memo)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            backButtonTapped()
        }
    }
    
    func configureSubviews() {
        view.addSubview(Label1)
        view.addSubview(Label2)
        
    }
    
    func makeConstraints() {
        Label1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(20)
        }
        Label2.snp.makeConstraints { make in
            make.top.equalTo(Label1.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
        
        func setNavigationBar() {
            let editButton = UIBarButtonItem(title: "수정하기", style: .plain, target: self, action: #selector(editButtonTapped))
            navigationItem.rightBarButtonItem = editButton
        }
        
        @objc func editButtonTapped() {
            let MemoEditViewController = MemoEditViewController()
            
            MemoEditViewController.memo = memo
            MemoEditViewController.index = index
            MemoEditViewController.delegate = self
            self.navigationController?.pushViewController(MemoEditViewController, animated: true)
        }
        
    @objc func backButtonTapped() {
        guard let updatedMemo = createUpdatedMemo() else {
            return
        }
        
        delegate?.didUpdateMemo(updatedMemo, atIndex: index!)
        self.navigationController?.popViewController(animated: true)
    }

        func createUpdatedMemo() -> Memo? {
            guard let updatedTitle = Label1.text,
                  let updatedContent = Label2.text else {
                return nil
            }
            
            return Memo(id: memo?.id, title: updatedTitle, content: updatedContent)
        }
        
        func displayMemo(_ memo: Memo) {
            Label1.text = memo.title
            Label2.text = memo.content
        }
    }




