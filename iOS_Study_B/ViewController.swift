//
//  ViewController.swift
//  Calculator
//
//  Created by 황채웅 on 2023/11/08.
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
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "연산자를 선택해주세요."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    let num1TextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "숫자1 입력"
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.keyboardType = .numberPad
        textfield.borderStyle = .roundedRect
        
        return textfield
    }()
    let num2TextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "숫자2 입력"
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.backgroundColor = .white
        textfield.keyboardType = .numberPad
        textfield.borderStyle = .roundedRect
        
        return textfield
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    let minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    let mplButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("*", for: .normal)
        button.addTarget(self, action: #selector(mplButtonTapped), for: .touchUpInside)
        return button
    }()
    let divButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("÷", for: .normal)
        button.addTarget(self, action: #selector(divButtonTapped), for: .touchUpInside)
        return button
    }()
    let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.91, green: 0.64, blue: 0.24, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("초기화", for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        super.viewDidLoad()
        configureSubviews()
        makeConstraints()
        // Do any additional setup after loading the view.
    }
    func configureSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(resultLabel)
        view.addSubview(num1TextField)
        view.addSubview(num2TextField)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(mplButton)
        view.addSubview(divButton)
        view.addSubview(resetButton)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(29)
        }
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(220)
        }
        num1TextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(83)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(38)
        }
        num2TextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(144)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(38)
        }
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(288)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
        }
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(plusButton.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
        }
        mplButton.snp.makeConstraints { make in
            make.top.equalTo(minusButton.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
        }
        divButton.snp.makeConstraints { make in
            make.top.equalTo(mplButton.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
        }
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(divButton.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(36)
            make.height.equalTo(45)
        }
    }
    
    @objc func plusButtonTapped() {
        guard let num1Text = num1TextField.text, !num1Text.isEmpty,
              let num2Text = num2TextField.text, !num2Text.isEmpty else {
            // 입력값이 하나라도 없을 때
            resultLabel.text = "숫자를 모두 입력해주세요."
            return
        }

        guard let num1 = Int(num1Text), let num2 = Int(num2Text) else {
            // 입력값 중 하나라도 숫자가 아닐 때
            resultLabel.text = "숫자만 입력해주세요."
            return
        }
        resultLabel.text = String(num1 + num2)
    }
    @objc func minusButtonTapped() {
        guard let num1Text = num1TextField.text, !num1Text.isEmpty,
              let num2Text = num2TextField.text, !num2Text.isEmpty else {
            // 입력값이 하나라도 없을 때
            resultLabel.text = "숫자를 모두 입력해주세요."
            return
        }

        guard let num1 = Int(num1Text), let num2 = Int(num2Text) else {
            // 입력값 중 하나라도 숫자가 아닐 때
            resultLabel.text = "숫자만 입력해주세요."
            return
        }
        resultLabel.text = String(num1 - num2)
    }
    @objc func mplButtonTapped() {
        guard let num1Text = num1TextField.text, !num1Text.isEmpty,
              let num2Text = num2TextField.text, !num2Text.isEmpty else {
            // 입력값이 하나라도 없을 때
            resultLabel.text = "숫자를 모두 입력해주세요."
            return
        }

        guard let num1 = Int(num1Text), let num2 = Int(num2Text) else {
            // 입력값 중 하나라도 숫자가 아닐 때
            resultLabel.text = "숫자만 입력해주세요."
            return
        }
        resultLabel.text = String(num1*num2)
    }
    @objc func divButtonTapped() {
        guard let num1Text = num1TextField.text, !num1Text.isEmpty,
              let num2Text = num2TextField.text, !num2Text.isEmpty else {
            // 입력값이 하나라도 없을 때
            resultLabel.text = "숫자를 모두 입력해주세요."
            return
        }

        guard let num1 = Float(num1Text), let num2 = Float(num2Text) else {
            // 입력값 중 하나라도 숫자가 아닐 때
            resultLabel.text = "숫자만 입력해주세요."
            return
        }
        if num2==0{
            resultLabel.text = "0으로 나눌 수 없습니다."
        }else{
            resultLabel.text = String(num1/num2)
        }
    }
    @objc func resetButtonTapped() {
        num1TextField.text = nil
        num2TextField.text = nil
        resultLabel.text = "연산자를 선택해주세요."
    }
    

}
