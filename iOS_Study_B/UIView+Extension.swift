//
//  UIView+Extension.swift
//  iOS_Study_B
//
//  Created by 정민지 on 2023/10/04.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {//모따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
