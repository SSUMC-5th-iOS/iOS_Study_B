//
//  ViewController.swift
//  iOS_Study_B
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerBackgroundView: UIView!
    @IBOutlet weak var homeBoxView: UIView!
    @IBOutlet weak var homeBoxViewSecond: UIView!
    @IBOutlet weak var homeBoxViewThird: UIView!
    @IBOutlet weak var homeBoxViewFourth: UIView!
    @IBOutlet weak var homeBoxViewFifth: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }

        headerBackgroundView.layer.cornerRadius = 25
        homeBoxView.layer.cornerRadius = 15
        homeBoxViewSecond.layer.cornerRadius = 15
        homeBoxViewThird.layer.cornerRadius = 15
        homeBoxViewFourth.layer.cornerRadius = 15
        homeBoxViewFifth.layer.cornerRadius = 15


        //원하는 모서리만 둥글게 만들기, 좌하단 우하단
        headerBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

