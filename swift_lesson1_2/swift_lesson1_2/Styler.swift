//
//  Styler.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import UIKit

class Styler {

    func styleTextField(_ textfield:UITextField) {

        // Create the bottom line
        let bottomLine = CALayer()

        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)

        bottomLine.backgroundColor = UIColor(red:0.04, green:0.17, blue:0.44, alpha:1.0).cgColor

        // Remove border on text field
        textfield.borderStyle = .none

        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)

    }

    func styleFilledButton(_ button:UIButton) {

        // Filled rounded corner style
        button.backgroundColor = UIColor(red: 0.00, green: 0.38, blue: 1.00, alpha: 1.00)
        button.layer.cornerRadius = 4.0
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 13)
        button.setTitleColor(.white, for: .normal)
    }

    func styleHollowButton(_ button:UIButton) {

        // Hollow rounded corner style
        button.layer.borderWidth = 2
		button.layer.borderColor = UIColor(red: 0.00, green: 0.38, blue: 1.00, alpha: 1.00).cgColor
        button.setTitleColor(UIColor(red: 0.00, green: 0.38, blue: 1.00, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "Copperplate-Bold", size: 13)
		button.layer.cornerRadius = 4.0
        button.tintColor = UIColor.white
    }

    static func isPasswordValid(_ password : String) -> Bool {

        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }


    func fieldValidation(_ field: UITextField) -> String? {
        // Проверка что во всех полях есть значения
        let cleanField = field.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleanField == "" {
            return "Пожалуйста заполни каждое поле!"
        }
        return nil
    }
}
