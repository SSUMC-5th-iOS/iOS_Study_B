//
//  AddMemoViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/15/23.
//

import UIKit
import SnapKit

struct MemoInformation: Identifiable {
    var id: ObjectIdentifier?
    var title: String?
    var content: String?
}

class AddMemoViewController: UIViewController {
    let TitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    let ContentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "내용 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
        
        navigationItem.title = "메모 작성"
        setNavigationBar()
    }
    
    func configureSubviews() {
        view.addSubview(TitleTextField)
        view.addSubview(ContentTextField)
            
    }
    
    func makeConstraints() {
        TitleTextField.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)}
        ContentTextField.snp.makeConstraints{make in
            make.top.equalTo(TitleTextField.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)}
        }
    
    func setNavigationBar() {
        let addButton = UIBarButtonItem(title: "작성하기" , style: .plain, target: self, action: #selector(addButtonTapped))
                navigationItem.rightBarButtonItem = addButton
    }
    @objc func addButtonTapped() {
        guard let title = TitleTextField.text, let content = ContentTextField.text else {
                // 제목 또는 내용이 nil일 경우 처리
                return
            }

            // 입력된 값으로 Memo 객체 생성
            let newMemo = MemoInformation(id: ObjectIdentifier(self), title: title, content: content)

            // ViewController에 대한 참조를 가져와 새로운 메모를 추가
            if let viewController = navigationController?.viewControllers.first as? MainViewController {
                viewController.addMemo(newMemo)
            }
        
        self.navigationController?.popViewController(animated: true)
    }
}
