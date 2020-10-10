//
//  APIResponse.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import Foundation

struct CarInfo: Decodable {
    var images: [String]
    var name: String
    var price: Float
}

struct APIResponse: Decodable {
    let probabilities = [String: Double]()

    enum CodingKeys: String, CodingKey {
        case probabilities = "data"
    }
}
