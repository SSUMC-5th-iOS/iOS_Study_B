//
//  AddMemoViewController.swift
//  TableView
//
//  Created by 황채웅 on 2023/11/15.
//

import UIKit
import SnapKit

class AddMemoViewController: UIViewController {

    var memoList: [Memo] = []
    
    let titleTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "제목 입력..."
        return textField
    }()
    
    let memoTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "메모 입력..."
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "메모 작성"
        setNavigationBar()
        configureSubviews()
        makeConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(memoTextField)
        view.addSubview(titleTextField)
    }
    
    func makeConstraints() {
        memoTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(65)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        titleTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    func setNavigationBar() {
        let addButton = UIBarButtonItem(title: "작성하기", style: .plain, target: self, action: #selector(writeButtonTapped))
                navigationItem.rightBarButtonItem = addButton
            
    }
    
    @objc func writeButtonTapped(){
        guard let title = titleTextField.text, let content = memoTextField.text else {
                return
            }
        let memo = Memo(title: title, content: content)
        memoList.append(memo)
        self.navigationController?.popViewController(animated: true)
    }
}
