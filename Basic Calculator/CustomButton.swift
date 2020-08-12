//
//  CustomButton.swift
//  Basic Calculator
//
//  Created by Paul Franco on 8/11/20.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setUpButton()
    }
    
    
    func setUpButton() {
        setShadow()
        layer.cornerRadius  = 8
        layer.borderWidth   = 1
        layer.borderColor   = UIColor.darkGray.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
}
