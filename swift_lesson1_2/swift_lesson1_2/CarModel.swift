//
//  CarModel.swift
//  AutoMobile
//
//  Created by Екатерина Вишневская on 10.10.2020.
//

import UIKit

class CarModel {
    var title: String
    var detail: String
    var cover: UIImage
    var favorite: Bool
    
    init(title: String) {
        self.title = title
        self.cover = UIImage(named: "Car")!
        self.detail = "Unknown"
        self.favorite = false
    }
}
