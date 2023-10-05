//
//  SecondViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/05.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }

    @IBOutlet weak var textField: UITextField!
    var previousViewController: FirstViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate = self
    }
    
}
