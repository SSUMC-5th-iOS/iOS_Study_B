//
//  MemoViewController.swift
//  iOS_Study_B
//
//  Created by 임아영 on 11/16/23.
//

import UIKit
import SnapKit

class MemoViewController: UIViewController {
    
    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "    메모 입력"
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.keyboardType = .default
        textfield.layer.cornerRadius = 5.0
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1.0
        
        return textfield
    }()
    
    // 초기 메모 내용을 설정하기 위한 변수
    var initialMemoContent: String?
    var memoIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "메모 작성"
        
        configureSubviews()
        makeConstraints()
        setNavigationBar()
        
        // 초기 메모 내용이 있다면 텍스트 필드에 설정
        if let initialContent = initialMemoContent {
            textfield.text = initialContent
        }
    }
    
    func configureSubviews() {
        view.addSubview(textfield)
    }
    
    func makeConstraints() {
        textfield.snp.makeConstraints { make in
            make.height.equalTo(40.0)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
    }
    
    func setNavigationBar() {
        let setButton = UIBarButtonItem(title: "작성하기", style: .plain, target: self, action: #selector(setButtonTapped))
        navigationItem.rightBarButtonItem = setButton
    }
    
    var didUpdateMemo: ((String) -> Void)?
    
    @objc func setButtonTapped() {
        if let content = textfield.text, !content.isEmpty {
            if let viewController = navigationController?.viewControllers.first(where: { $0 is ViewController }) as? ViewController {
                if let index = memoIndex {
                    //기존 메모 수정
                    viewController.tasks[index] = content
                } else {
                    //새 메모 추가
                    viewController.tasks.append(content)
                }
                viewController.tableview.reloadData()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
    
extension MemoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setButtonTapped()
        
        return true
    }
}
