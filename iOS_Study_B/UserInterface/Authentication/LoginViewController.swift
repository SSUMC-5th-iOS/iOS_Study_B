//
//  LoginViewController.swift
//  Catstagram
//
//  Created by 정민지 on 2023/10/01.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
      
    }
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        //옵셔널
        //값이 있을수도 없을 수도
        let text = sender.text ?? ""
        self.loginButton.backgroundColor  = text.isValidEmail() ? .facebookColor :  .disabledButtonColor
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입정보를 전달받아서, 그것과 textField 데이터가 일치하면,
        //로그인이 되어야 한다.
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email && userInfo.password  == self.password
        {
            print("로그인 완료")
            let vc = storyboard?.instantiateViewController(identifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: true, completion: nil)
        } else {
            print("로그인 실패")
            print(userInfo.email)
            print(self.email)
            print(userInfo.password)
            print(self.password)
        }
        
    }
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        //1 스토리보드를 생성
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        //2 뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        //3 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated:true)
        
        //ARC -> 강한참조 /약한참조 -> ARC 낮춤
        registerViewController.userInfo = {[weak self](userInfo) in
            self?.userInfo = userInfo
            print(userInfo)
        }
    }
    
    private func setupAttribute() {
        //registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
