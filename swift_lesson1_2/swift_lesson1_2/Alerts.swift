//
//  Alerts.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import UIKit

enum AlertAnswer: String, Error {
    case responseProblem = "Ошибка при ответе сервера"
    case decodingProblem = "Ошибка декодирования даты"
    case otherProblem = "Непонятная ошибка"
    case carNotFound = "Машина не найдена"
//    case saveProduct = "Ваш товар сохранен"
//    case deleteAllProducts = "Ваша корзина удалена"

    var alert: UIAlertController {
        let message = self.rawValue
        let alertViewController = UIAlertController(title: "Уведомление", message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "ОК!", style: .cancel, handler: nil))
        return alertViewController
    }
}
