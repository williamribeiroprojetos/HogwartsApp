//
//  UITextFieldHelper.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 01/10/21.
//

import UIKit

extension UITextField {
    func setEditingColor() {
        //visual
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemYellow.cgColor
        
        //propriedades do texto
        //placeholder
        let color = UIColor.lightGray
        let placeholder = self.placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        self.textColor = .white
        self.backgroundColor = .clear
    }
    
    func setDefaultColor() {
        //visual
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
        //propriedades do texto
        //placeholder
        let color = UIColor.black
        let placeholder = self.placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        self.textColor = .white
        self.backgroundColor = .clear
    }
    
    func setErrorColor() {
        //visual
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemRed.cgColor
        
        //propriedades do texto
        //placeholder
        let color = UIColor.black
        let placeholder = self.placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        self.textColor = .white
        self.backgroundColor = .clear
    }
    
    func setDisableColor() {
        //visual
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
        //propriedades do texto
        //placeholder
        let color = UIColor.black
        let placeholder = self.placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        self.textColor = .gray
        self.isEnabled = false
        self.backgroundColor = .clear
    }
}
