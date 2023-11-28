//
//  MemoEditViewController.swift
//  iOS_Study_B
//
//  Created by 임아영 on 11/17/23.
//


import UIKit
import SnapKit

class MemoEditViewController: UIViewController {

    var memo: Memo?
    var index: Int?
    weak var delegate: MemoEditDelegate?

    let textfield: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.keyboardType = .default
        textfield.layer.cornerRadius = 5.0
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1.0

        return textfield
    }()
    
    let textfield2: UITextField = {
        let textfield2 = UITextField()
        textfield2.font = UIFont.systemFont(ofSize: 20)
        textfield2.keyboardType = .default
        textfield2.layer.cornerRadius = 5.0
        textfield2.layer.borderColor = UIColor.black.cgColor
        textfield2.layer.borderWidth = 1.0
        
        return textfield2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "메모 수정"

        configureSubviews()
        makeConstraints()
        setNavigationBar()

        if let memo = memo {
            displayMemo(memo)
        }
    }

    func configureSubviews() {
        view.addSubview(textfield)
        view.addSubview(textfield2)
    }

    func makeConstraints() {
        textfield.snp.makeConstraints { make in
            make.height.equalTo(40.0)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        textfield2.snp.makeConstraints { make in
            make.height.equalTo(40.0)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
    }

    func setNavigationBar() {
        let setButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(setButtonTapped))
        navigationItem.rightBarButtonItem = setButton
    }

    @objc func setButtonTapped() {
        guard let updatedMemo = createUpdatedMemo() else {
                return
            }
        delegate?.didUpdateMemo(updatedMemo, atIndex: index!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func displayMemo(_ memo: Memo) {
        textfield.text = memo.title
        textfield2.text = memo.content
    }
    
    func createUpdatedMemo() -> Memo? {
        guard let updatedLabel1 = textfield.text,
              let updatedLabel2 = textfield2.text else {
            return nil
        }

        return Memo(id: memo?.id, title: updatedLabel1, content: updatedLabel2)
    }
    
}

