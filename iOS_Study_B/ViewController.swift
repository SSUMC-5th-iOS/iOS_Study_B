//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "계산기"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        return label
    }()
    
    let number1TextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.placeholder = "숫자 1 입력"
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let number2TextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.placeholder = "숫자 2 입력"
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "연산자를 선택해주세요."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 233/255, green: 164/255, blue: 61/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 18)
        
        //클릭시 실행할 동작
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let subButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 233/255, green: 164/255, blue: 61/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 18)
        
        //클릭시 실행할 동작
        button.addTarget(self, action: #selector(subButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let mulButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 233/255, green: 164/255, blue: 61/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 18)
        
        //클릭시 실행할 동작
        button.addTarget(self, action: #selector(mulButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let divButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("÷", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 233/255, green: 164/255, blue: 61/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 18)
        
        //클릭시 실행할 동작
        button.addTarget(self, action: #selector(divButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 233/255, green: 164/255, blue: 61/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 18)
        
        //클릭시 실행할 동작
        button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureSubviews()
        makeConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(number1TextField)
        view.addSubview(number2TextField)
        view.addSubview(resultLabel)
        view.addSubview(plusButton)
        view.addSubview(subButton)
        view.addSubview(mulButton)
        view.addSubview(divButton)
        view.addSubview(resetButton)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(57)
            make.centerX.equalToSuperview()
            make.width.equalTo(114)
            make.height.equalTo(23)
        }
        number1TextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(111)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(38)
        }
        number2TextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(172)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(38)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.centerX.equalToSuperview()
            make.width.equalTo(188)
            make.height.equalTo(28)
        }
        plusButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(316)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(45)
        }
        subButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(377)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(45)
        }
        mulButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(438)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(45)
        }
        divButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(499)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(45)
        }
        resetButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(560)
            make.centerX.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(36)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-36)
            make.height.equalTo(45)
        }
    }
    func performCalculation(operation: (Int, Int) -> Int) {
        // 입력이 숫자로 변환 가능한 경우
        if let inputText1 = number1TextField.text, let number1 = Int(inputText1),
           let inputText2 = number2TextField.text, let number2 = Int(inputText2) {
            let result = operation(number1, number2)
            resultLabel.text = String(result)
        }
        // 빈 문자열이 있는 경우
        else if number1TextField.text?.isEmpty == true  {
            resultLabel.text = "숫자를 모두 입력해주세요."
        } else if number2TextField.text?.isEmpty == true {
            resultLabel.text = "숫자를 모두 입력해주세요."
        }
        // 빈 문자열이 아닌데 숫자로 변환이 불가능한 경우
        else {
            resultLabel.text = "숫자만 입력해주세요."
        }
        
        
    }
    
    @objc func plusButtonPressed() {
        performCalculation(operation: +)
    }
    @objc func subButtonPressed() {
        performCalculation(operation: -)
    }
    @objc func mulButtonPressed() {
        performCalculation(operation: *)
    }
    @objc func divButtonPressed() {
        if number2TextField.text?.isEmpty == true {
            performCalculation(operation: /)
        }
        else if let inputText2 = number2TextField.text, !inputText2.isEmpty, let divisor = Int(inputText2), divisor != 0 {
                performCalculation(operation: /)
            } else {
                resultLabel.text = "0으로 나눌 수 없습니다."
            }
    }
    @objc func resetButtonPressed() {
        number1TextField.text = ""
        number2TextField.text = ""
        resultLabel.text = "연산자를 선택해주세요."
    }
}
