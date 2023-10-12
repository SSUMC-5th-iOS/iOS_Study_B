//
//  RegisterViewController.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/08.
//

import UIKit

class RegisterViewController: UIViewController {

    //Mark: -Properties
    //유효성 검사를 위한 프로퍼티
    var isVaildEmail = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isVaildName = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isVaildNickname = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    var isVaildPassword = false{
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    //Textfields
    //IBOutlet으로 가져온 텍스트필드
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    //프로퍼티 한번에 처리
    var textFields: [UITextField]{
        [emailTextField,nameTextField,nicknameTextField,passwordTextField]
    }
    
    //Mark: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    //Mark: -Action
    
    @objc
    func textFieldEditingChanged(_ sender : UITextField){
        let text = sender.text ?? ""
        
        switch sender{
        case emailTextField:
            self.isVaildEmail=text.isValidEmail()
        case nameTextField:
            self.isVaildName=text.count>2
        case nicknameTextField:
            self.isVaildNickname=text.count>2
        case passwordTextField:
            self.isVaildPassword=text.isValidPassword()
        default :
            fatalError("Missing textfield...")
            
        }
        
    }
    //Mark: -Helpers
    private func setupTextField(){
        textFields.forEach{tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_: )), for: .editingChanged)
        }
    }
    //사용자가 입력한 회원정보를 확인하고 -> UI업데이트
    private func validateUserInfo(){
        if isVaildName
            && isVaildName
            && isVaildNickname
            && isVaildPassword{
            self.signupButton.isEnabled=true
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = UIColor(named:"facebookColor")}
        }
            else{
                self.signupButton.isEnabled=false
                UIView.animate(withDuration: 0.33){
                    self.signupButton.backgroundColor = UIColor(named:"disabledButtonColor")
                }
        }
        
    }
}
extension String {
    func isValidPassword() -> Bool {
        //대문자,소문자,특수문자 8자 이상일 때 -> True
        let regularExpression = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@",regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
        // @2글자
        func isValidEmail() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate.init(format: "SELF MATCHES %@",emailRegEx)
            return emailTest.evaluate(with: self)
        }

}

