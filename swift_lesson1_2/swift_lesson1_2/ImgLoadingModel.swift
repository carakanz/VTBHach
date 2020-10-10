//
//  ImgLoadingModel.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import UIKit

enum ImgLoadingModel {
    // MARK: Use cases

    enum ImageData {
        struct Request {
        }
        struct Response {
            var image: UIImage?
        }
        struct ViewModel {
            var image: UIImage?
        }
    }
}
