//
//  SignUp2ViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/15/23.
//

import UIKit
import SnapKit

class SignUp2ViewController: UIViewController, UITextFieldDelegate {
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        return label
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "전화번호"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        return textField
    }()

    let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "생년월일"
        return label
    }()
    
    let birthday2Label: UILabel = {
        let label = UILabel()
        return label
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return datePicker
    }()

    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("이전", for: .normal)
        button.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        return button
    }()

    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("가입", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureSubviews()
        makeConstraints()
        
        phoneNumberTextField.delegate = self
    }

    func configureSubviews() {
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(birthdayLabel)
        view.addSubview(birthday2Label)
        view.addSubview(datePicker)
        view.addSubview(previousButton)
        view.addSubview(cancelButton)
        view.addSubview(signUpButton)
    }

    func makeConstraints() {
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }

        birthdayLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        
        birthday2Label.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview().offset(70)
        }

        datePicker.snp.makeConstraints { make in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            
        }

        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.trailing.equalTo(previousButton.snp.leading).offset(-100)
        }
        
        previousButton.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.leading.equalTo(previousButton.snp.trailing).offset(100)
        }
    }

    @objc func datePickerValueChanged() {
        // DatePicker 값 변경 시 생년월일 레이블에 반영
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        birthday2Label.text = "\(dateFormatter.string(from: datePicker.date))"
        
        // 가입 버튼 활성화 여부 업데이트
        updateSignUpButtonState()
    }

    @objc func previousButtonTapped() {
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.birthdate = nil

        navigationController?.popViewController(animated: true)
    }

    @objc func cancelButtonTapped() {
        // 취소 버튼 로직 구현
        UserInformation.shared.profileImage = nil
        UserInformation.shared.ID = nil
        UserInformation.shared.password = nil
        UserInformation.shared.introduction = nil
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.birthdate = nil
        
        // 모든 정보 지우고 화면1로 돌아가기
        for viewController in navigationController?.viewControllers ?? [] {
                if let loginViewController = viewController as? LoginViewController {
                    navigationController?.popToViewController(loginViewController, animated: true)
                    return
                }
            }
    }

    @objc func signUpButtonTapped() {
        UserInformation.shared.phoneNumber = phoneNumberTextField.text
        UserInformation.shared.birthdate = datePicker.date
        
        for viewController in navigationController?.viewControllers ?? [] {
                if let loginViewController = viewController as? LoginViewController {
                    navigationController?.popToViewController(loginViewController, animated: true)
                    return
                }
            }
    }

    func updateSignUpButtonState() {
        // 필요한 조건에 따라 가입 버튼의 활성화/비활성화 상태 업데이트
        let isPhoneNumberValid = !(phoneNumberTextField.text?.isEmpty ?? true)
        let isBirthdayValid = true

        signUpButton.isEnabled = isPhoneNumberValid && isBirthdayValid
    }
}
