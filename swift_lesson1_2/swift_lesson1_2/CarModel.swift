//
//  CarModel.swift
//  AutoMobile
//
//  Created by Екатерина Вишневская on 10.10.2020.
//

import UIKit

class CarModel {
    var title: String
    var price: Int
    var photo: UIImage
    var favorite: Bool
    
    init(title: String) {
        self.title = title
        self.photo = UIImage(named: "Car")!
        self.price = 0
        self.favorite = false
    }
}
