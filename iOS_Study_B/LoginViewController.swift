//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    let IDTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ID"
        textField.borderStyle = .roundedRect
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()

    let SignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(SignInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let SignUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Sign Up", for: .normal)
            button.setTitleColor(.red, for: .normal)
            button.addTarget(self, action: #selector(SignUpButtonTapped), for: .touchUpInside)
            return button
        }()
    
    lazy var backgroundTapRecognizer: UITapGestureRecognizer = {
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))
            return recognizer
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureSubviews()
        makeConstraints()
        
        view.addGestureRecognizer(backgroundTapRecognizer)
        
        IDTextField.delegate = self
        passwordTextField.delegate = self
    }

    func configureSubviews() {
        view.addSubview(IDTextField)
        view.addSubview(passwordTextField)
        view.addSubview(SignInButton)
        view.addSubview(SignUpButton)
        
    }

    func makeConstraints() {
        IDTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(200)
        }

        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(IDTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
        }

        SignInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-50)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
        SignUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(50)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
    }

    @objc func SignInButtonTapped() {
        // 로그인 버튼 동작
    }
    
    @objc func SignUpButtonTapped() {
            // Sign Up 버튼 동작
            let additionalInfoVC = SignUpViewController()
            navigationController?.pushViewController(additionalInfoVC, animated: true)
        }
    
    @objc func handleBackgroundTap() {
            // 배경 탭 시 키보드 내리기
            view.endEditing(true)
        }
        // UITextFieldDelegate 메서드 구현
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // 리턴 키를 누르면 키보드 내리기
            textField.resignFirstResponder()
            return true
    }
}
