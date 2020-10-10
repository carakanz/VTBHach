//
//  ImgLoadingInteractor.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import UIKit

protocol CleanSwiftBusinessLogic: class {
    func saveImage(request: ImgLoadingModel.ImageData.Request)
    func showGallery(request: ImgLoadingModel.ImageData.Request)
    func accessCamera(request: ImgLoadingModel.ImageData.Request)
    func setImage(request: ImgLoadingModel.ImageData.Request)
    func clearCache()
}

protocol CleanSwiftDataStore {
    var image: UIImage? { get set }
}

class InteractorForLoadImageView: NSObject, CleanSwiftBusinessLogic, CleanSwiftDataStore {


    var imagePickerController = UIImagePickerController()

    func saveImage(request: ImgLoadingModel.ImageData.Request) {

    }

    var presenter: CleanSwiftPresentationLogic?
    var image: UIImage?

    // MARK: работа с изображением

    func getImage(request: ImgLoadingModel.ImageData.Request) {


    }

    func setImage(request: ImgLoadingModel.ImageData.Request) {
        let response = ImgLoadingModel.ImageData.Response(image: image)
        presenter?.presentImage(response: response)
    }

    func clearCache() {
        image = nil
        presenter?.clearImage()
    }
}


extension InteractorForLoadImageView:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	func accessCamera(request: ImgLoadingModel.ImageData.Request) {
		imagePickerController.delegate = self
		if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
		{
			imagePickerController.sourceType = .camera
			imagePickerController.allowsEditing = true
			presenter?.imagePicker(imagePickerController)
		} else {
			let alert  = UIAlertController(title: "Прости", message: "У тебя не работает камера", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			presenter?.alertNoCam()
		}
	}

    func showGallery(request: ImgLoadingModel.ImageData.Request) {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        presenter?.imagePicker(imagePickerController)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let response = ImgLoadingModel.ImageData.Response(image: image)
            presenter?.presentImage(response: response)
        }
    }
}
