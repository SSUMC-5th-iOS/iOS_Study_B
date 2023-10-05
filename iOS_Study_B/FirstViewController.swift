//
//  FirstViewController.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/05.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}

class FirstViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate :ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
