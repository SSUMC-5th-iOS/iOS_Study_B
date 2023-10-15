//
//  SecondViewController.swift
//  iOS_Study_B
//
//  Created by 임아영 on 2023/10/16.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previoisViewContRoller?.label.text = self.textfield.text
    }
    
    
    
    @IBOutlet weak var textfield: UITextField!
    var previoisViewContRoller : ViewController?
    
    
    @IBAction func ButtonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previoisViewContRoller?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
