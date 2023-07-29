//
//  UITextFieldExtensions.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import UIKit
extension UITextField {
    
    /// Left padding of the TextField
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
}
