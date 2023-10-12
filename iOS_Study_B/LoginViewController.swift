//
//  LoginViewController.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/08.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
        
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널
        // 값이 있을 수도 있고 없을 수도 있음
        let text = sender.text ?? ""
        self.email = text
        }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        // 화면 전환 구현 순서
        // 1.스토리보드를 생성
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        // 2.뷰컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(identifier: "RegisterVC") as! RegisterViewController
        // 3.화면전환 메소드를 이용하여 화면 전환
        // self.present(registerViewController,animated: true,completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}
