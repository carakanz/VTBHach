//
//  ImgLoadingPresenter.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import UIKit

protocol CleanSwiftPresentationLogic {
    func imagePicker(_ imagePickerController: UIImagePickerController)
    func presentImage(response: ImgLoadingModel.ImageData.Response)
    func clearImage()
	func alertNoCam()
}

class PresenterForLoadImageView: CleanSwiftPresentationLogic {

	let api = API()

    func imagePicker(_ imagePickerController: UIImagePickerController) {
        viewController?.showImagePickerView(imagePickerController)

    }

    weak var interactor: CleanSwiftBusinessLogic?
    weak var viewController: CleanSwiftDisplayLogic?

    // MARK: работа с картинкой

	func alertNoCam() {
		viewController?.alertNoCam()
	}

    func presentImage(response: ImgLoadingModel.ImageData.Response) {

        if let image = response.image  {
            let viewModel = ImgLoadingModel.ImageData.ViewModel(image: image)
            viewController?.displayImage(viewModel: viewModel)
			getCarInfo(carImage: image)
        } else {
//            viewController?.showAlert()
        }
    }

	func getCarInfo(carImage: UIImage) -> String {
		let imageData: NSData = carImage.jpegData(compressionQuality: 1.0)! as NSData
		let imageInBase64 = imageData.base64EncodedString(options: .lineLength64Characters)

		api.getCarInfo(at: imageInBase64, getInfo: { (APIResponse) in
			if APIResponse.probabilities.isEmpty {
//				self.present(AlertAnswer.carNotFound.alert, animated: true, completion: nil)
//				self.cameraState = true
			} else {
				guard let cars = APIResponse.probabilities.first else { return }
			}
		}) { (error) in
			self.viewController?.alertOtherMistake()
		}
		return "asdf"
	}

    func clearImage() {
        let viewModel = ImgLoadingModel.ImageData.ViewModel(image: nil)
        viewController?.displayImage(viewModel: viewModel)
    }

}
