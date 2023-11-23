//
//  MemoViewController.swift
//  iOS_Study_B
//
//  Created by 임아영 on 11/16/23.
//

import UIKit
import SnapKit

struct Memo : Identifiable {
    var id: ObjectIdentifier?
    var title: String?
    var content: String?
}


class MemoViewController: UIViewController {
    
    let textfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목 입력"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        
        return textField
    }()
    
    let textfield2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "내용 입력"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.keyboardType = .default
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        
        return textField
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
      
    }
    
    func configureSubviews() {
        view.addSubview(textfield)
        view.addSubview(textfield2)
    }
    
    func makeConstraints() {
        textfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(40.0)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        textfield2.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.bottom).offset(20)
            make.height.equalTo(40.0)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
    
    func setNavigationBar() {
        let addButton = UIBarButtonItem(title: "작성하기", style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
            guard let title = textfield.text, let content = textfield2.text else {
                    return
                }
                let newMemo = Memo(id: ObjectIdentifier(self), title: title, content: content)

                if let viewController = navigationController?.viewControllers.first as? ViewController {
                    viewController.addMemo(newMemo)
                }

            self.navigationController?.popViewController(animated: true)
        }
    }
