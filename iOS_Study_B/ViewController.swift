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
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    let text1Field: UITextField = {
        let text = UITextField()
        text.placeholder = "숫자 1 입력"
        text.font = UIFont.systemFont(ofSize: 20)
        text.keyboardType = .numberPad
        text.borderStyle = .roundedRect
        
        return text
    }()
    
    let text2Field: UITextField = {
        let text = UITextField()
        text.placeholder = "숫자 2 입력"
        text.font = UIFont.systemFont(ofSize: 20)
        text.keyboardType = .numberPad
        text.borderStyle = .roundedRect
        
        return text
    }()
    
    let selectLabel: UILabel = {
        let label = UILabel()
        label.text = "연산자를 선택해주세요."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("+", for: .normal)
        
        return button
    }()
    
    let subButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("-", for: .normal)
        
        return button
    }()
    
    let xButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("x", for: .normal)
        
        return button
    }()
    
    let divButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("÷", for: .normal)
        
        return button
    }()
    
    let setButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("초기화", for: .normal)
        
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
            view.addSubview(text1Field)
            view.addSubview(text2Field)
            view.addSubview(selectLabel)
            view.addSubview(plusButton)
            view.addSubview(subButton)
            view.addSubview(xButton)
            view.addSubview(divButton)
            view.addSubview(setButton)
            
            plusButton.addTarget(self, action: #selector(operationButtonTapped), for: .touchUpInside)
            subButton.addTarget(self, action: #selector(operationButtonTapped), for: .touchUpInside)
            xButton.addTarget(self, action: #selector(operationButtonTapped), for: .touchUpInside)
            divButton.addTarget(self, action: #selector(operationButtonTapped), for: .touchUpInside)
            setButton.addTarget(self, action: #selector(setButtonTapped), for: .touchUpInside)
            
            textfiled1 = text1Field
            textfiled2 = text2Field
        }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(29)
        }
        
        text1Field.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(83)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
        }
        
        text2Field.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(144)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            
        }
        
        selectLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(222)
        }
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(288)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
            
        }
        subButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(349)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
            
            
        }
        xButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(410)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
            
            
        }
        divButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(471)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
            
            
        }
        setButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(532)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
        }
    }
    
    var textfiled1: UITextField!
    var textfiled2: UITextField!
    
    @objc func operationButtonTapped(sender: UIButton) {
        if let operationTitle = sender.title(for: .normal) {
            if let number1 = Double(textfiled1?.text ?? "0"),
               let number2 = Double(textfiled2?.text ?? "0") {
                var result: Double = 0
                
                switch operationTitle {
                case "+":
                    result = number1 + number2
                case "-":
                    result = number1 - number2
                case "x":
                    result = number1 * number2
                case "÷":
                    if number2 != 0 {
                        result = number1 / number2
                    } else {
                        selectLabel.text = "0으로 나눌 수 없습니다."
                        //return을 추가해야 위 문장이 나옴
                        return
                    }
                    
                default:
                    break
                }
                
                // NumberFormatter를 사용하여 소수점 이하가 0으로 끝나지 않게 형식을 지정
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                
                if let formattedResult = formatter.string(from: NSNumber(value: result)) {
                    selectLabel.text = "\(formattedResult)"
                }
            } else if textfiled1?.text == "" || textfiled2?.text == "" {
                       selectLabel.text = "숫자를 모두 입력해주세요."
                   } else {
                       selectLabel.text = "숫자만 입력해주세요."
                   }
               }
           }
    
    @objc func setButtonTapped(sender: UIButton) {
          textfiled1?.text = ""
          textfiled2?.text = ""
        selectLabel.text = "연산자를 선택해주세요."
      }
  }
