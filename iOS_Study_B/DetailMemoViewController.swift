//
//  DetailMemoViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/20/23.
//

import UIKit
import SnapKit

class DetailMemoViewController: UIViewController {
    var memo: MemoInformation?
    var index: Int?
    weak var delegate: EditMemoDelegate?
    
    let TitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let ContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
        
        navigationItem.title = "메모 상세"
        setNavigationBar()
        
        if let memo = memo {
            displayMemoInformation(memo)
        }
    }
    
    //pop으로 화면이 사라질때 함수 호출
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
                backButtonTapped()
            }
    }
    
    func configureSubviews() {
        view.addSubview(TitleLabel)
        view.addSubview(ContentLabel)
        
    }
    
    func makeConstraints() {
        TitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)}
        ContentLabel.snp.makeConstraints { make in
            make.top.equalTo(TitleLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)}
    }
    
    // 네비게이션 바 "수정하기" 버튼
    func setNavigationBar() {
        let editButton = UIBarButtonItem(title: "수정하기", style: .plain, target: self, action: #selector(editButtonTapped))
                navigationItem.rightBarButtonItem = editButton
    }
    
    // "수정하기" 버튼 눌렀을때 동작
    @objc func editButtonTapped() {
        let EditMemoViewController = EditMemoViewController()
        
        EditMemoViewController.memo = memo
        EditMemoViewController.index = index
        EditMemoViewController.delegate = self
        self.navigationController?.pushViewController(EditMemoViewController, animated: true)
    }
    
    //pop으로 화면이 사라질때 함수 호출 시 수행할 동작
    @objc func backButtonTapped() {
        guard let updatedMemo = createUpdatedMemo() else {
            return
        }

        delegate?.didUpdateMemo(updatedMemo, atIndex: index!)
        self.navigationController?.popViewController(animated: true)
    }
    
    //Label에 있는 내용들 새로운 메모 데이터에 담고 리턴하는 함수
    func createUpdatedMemo() -> MemoInformation? {
        guard let updatedTitle = TitleLabel.text,
        let updatedContent = ContentLabel.text else {
            return nil
        }
    
    return MemoInformation(id: memo?.id, title: updatedTitle, content: updatedContent)
    }
    
    //데이터 받아와서 기존의 Label내용 수정하는 함수
    func displayMemoInformation(_ memo: MemoInformation) {
        TitleLabel.text = memo.title
        ContentLabel.text = memo.content
    }
}

//데이터 전송시 필요한 애들
protocol EditMemoDelegate: AnyObject {
    func didUpdateMemo(_ memo: MemoInformation, atIndex: Int)
}

extension DetailMemoViewController: EditMemoDelegate {
    func didUpdateMemo(_ memo: MemoInformation, atIndex: Int) {
        displayMemoInformation(memo)
    }
}



