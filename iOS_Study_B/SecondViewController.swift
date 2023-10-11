//
//  SecondViewController.swift
//  iOS_Study_B
//
//  Created by Blu on 2023/10/11.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {

    var previousViewController: ViewController?

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        previousViewController?.delegate = self
    }


    @IBAction func buttonDismiss(_ sender: Any) {
        dismiss(animated: true)
        doChange()
    }

    func doChange() {
        previousViewController?.label.text = textField.text
    }
}
