//
//  SecondViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 11/15/23.
//

import UIKit
import SnapKit

class UserInformation {
    static let shared = UserInformation()

    var profileImage: UIImage?
    var ID: String?
    var password: String?
    var introduction: String?
    var phoneNumber: String?
    var birthdate: Date?
}

class SignUpViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .lightGray
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            return imageView
        }()

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

    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()

    let introductionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "자기소개를 입력하세요."
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor =  UIColor(
            red: CGFloat(0xFB) / 255.0,
            green: CGFloat(0xC7) / 255.0,
            blue: CGFloat(0x05) / 255.0,
            alpha: 1.0
        )
        textView.textColor = .black
        return textView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
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
        confirmPasswordTextField.delegate = self
        introductionTextView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectProfileImage))
                profileImageView.addGestureRecognizer(tapGesture)
        
        // 추가: 텍스트 필드 값이 변경될 때 호출되는 메서드 등록
               IDTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
               passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
               confirmPasswordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
           }

    func configureSubviews() {
           view.addSubview(profileImageView)
           view.addSubview(IDTextField)
           view.addSubview(passwordTextField)
           view.addSubview(confirmPasswordTextField)
           view.addSubview(introductionTextView)
            view.addSubview(cancelButton)
            view.addSubview(nextButton)
       }

       func makeConstraints() {
           profileImageView.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
               make.width.equalTo(130)
               make.height.equalTo(130)
           }


           IDTextField.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
               make.leading.equalTo(profileImageView.snp.trailing).offset(20)
               make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
               
           }

           passwordTextField.snp.makeConstraints { make in
               make.top.equalTo(IDTextField.snp.bottom).offset(15)
               make.leading.equalTo(profileImageView.snp.trailing).offset(20)
               make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
           }

           confirmPasswordTextField.snp.makeConstraints { make in
               make.top.equalTo(passwordTextField.snp.bottom).offset(15)
               make.leading.equalTo(profileImageView.snp.trailing).offset(20)
               make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
           }

           introductionTextView.snp.makeConstraints { make in
               make.top.equalTo(profileImageView.snp.bottom).offset(20)
               make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
               make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
               make.height.equalTo(500)
           }
           
           cancelButton.snp.makeConstraints { make in
               make.centerX.equalToSuperview().offset(-50)
               make.top.equalTo(introductionTextView.snp.bottom).offset(20)
           }

           nextButton.snp.makeConstraints { make in
               make.centerX.equalToSuperview().offset(50)
               make.top.equalTo(introductionTextView.snp.bottom).offset(20)
           }
       }
    @objc func selectProfileImage() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true

            present(imagePicker, animated: true, completion: nil)
        }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.editedImage] as? UIImage {
                // 선택한 이미지를 프로필 이미지뷰에 설정
                profileImageView.image = selectedImage
                // 선택한 이미지를 UserInformation에 저장
                UserInformation.shared.profileImage = selectedImage
            }

            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }

    @objc func cancelButtonTapped() {
        // 모든 정보 초기화하고 이전 화면으로 이동
        UserInformation.shared.profileImage = nil
        UserInformation.shared.ID = nil
        UserInformation.shared.introduction = nil
        navigationController?.popViewController(animated: true)
    }

    @objc func nextButtonTapped() {
        // 다음 버튼 눌렀을 때의 로직 구현
        let additionalInfoVC = SignUp2ViewController()
        
        UserInformation.shared.ID = IDTextField.text
        UserInformation.shared.password = passwordTextField.text
        UserInformation.shared.introduction = introductionTextView.text
        
        navigationController?.pushViewController(additionalInfoVC, animated: true)
    }

    @objc func textFieldDidChange() {
        // 텍스트 필드가 변경될 때마다 호출되는 로직 구현
        updateNextButtonState()
    }

    func updateNextButtonState() {
        // 필요한 조건에 따라 다음 버튼의 활성화/비활성화 상태 업데이트
        print("IDTextField: \(IDTextField.text ?? "")")
            print("passwordTextField: \(passwordTextField.text ?? "")")
            print("confirmPasswordTextField: \(confirmPasswordTextField.text ?? "")")
            print("introductionTextView: \(introductionTextView.text ?? "")")
        
        let isIDValid = !(IDTextField.text?.isEmpty ?? true)
        let isPasswordValid = !(passwordTextField.text?.isEmpty ?? true)
        let isConfirmPasswordValid = !(confirmPasswordTextField.text?.isEmpty ?? true) && (passwordTextField.text == confirmPasswordTextField.text)
        
        nextButton.isEnabled = isIDValid && isPasswordValid && isConfirmPasswordValid
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
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        // 편집을 시작할 때 초기 텍스트를 지우고 사용자가 직접 입력하도록 설정
        if textView.text == "자기소개를 입력하세요." {
            textView.text = ""
        }
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        // 텍스트가 변경될 때 호출되는 메서드
        updateNextButtonState()
    }
    
}
