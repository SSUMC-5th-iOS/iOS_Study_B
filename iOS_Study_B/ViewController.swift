//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Buttonnecessary: UIButton!
    @IBOutlet weak var Buttonshowinfo: UIButton!
    @IBOutlet weak var Buttonunnecessary: UIButton!
    @IBOutlet weak var Buttontotalprice: UIButton!
    
    var largeIsActive:Bool = false
    var mediumIsActive:Bool = false
    var isActive:Bool = false
    
    @IBOutlet weak var buttonMedium: UIButton!
    @IBOutlet weak var buttonLarge: UIButton!
    @IBOutlet weak var buttonDough: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Buttonnecessary.layer.cornerRadius = 15
        Buttonunnecessary.layer.cornerRadius = 15
        Buttontotalprice.layer.cornerRadius = 4
        
        Buttonshowinfo.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        
    }
    @IBAction func buttonMedium(_ sender: UIButton) {
        
        if mediumIsActive{
        }else{
            if(largeIsActive==true){
                largeIsActive = false
                buttonLarge.setImage(UIImage(named: "notselect"), for: .normal)
            }
            mediumIsActive = true
            buttonMedium.setImage(UIImage(named: "select"), for: .normal)
            
            
        }
    }
    @IBAction func buttonLarge(_ sender: UIButton) {
        if largeIsActive{
        }else{
            if(mediumIsActive == true)
            {
                mediumIsActive = false
                buttonMedium.setImage(UIImage(named: "notselect"), for: .normal)
            }
            largeIsActive = true
            buttonLarge.setImage(UIImage(named:"select"), for: .normal)
        }
    }
    @IBAction func buttonDough(_ sender: UIButton) {
        if isActive{
            isActive = false
            buttonDough.setImage(UIImage(named: "select"), for: .normal)
        }else{
            isActive = true
            buttonDough.setImage(UIImage(named:"allnotselect"), for: .normal)
        }
    }
    @IBAction func orderButtonDidTap(_ sender: UIButton) {
        // 1.스토리보드를 생성
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        // 2.뷰컨트롤러를 생성
        let orderViewController = storyboard.instantiateViewController(identifier: "OrderVC") as! OrderViewController
        // 3.화면전환 메소드를 이용하여 화면 전환
        self.navigationController?.pushViewController(orderViewController, animated: true)
    }
    


}

