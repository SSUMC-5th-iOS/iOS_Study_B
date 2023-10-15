//
//  UIView+Extension.swift
//  iOS_Study_B
//
//  Created by 황채웅 on 2023/10/11.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
