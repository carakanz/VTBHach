//
//  File.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import Foundation
import UIKit


protocol CleanSwiftDisplayLogic: class {
    func displayImage(viewModel: ImgLoadingModel.ImageData.ViewModel)
    func showImagePickerView(_ imagePickerController: UIImagePickerController)
	func alertNoCam()
	func alertOtherMistake()
	func displayCarName(carName: String)
//    func showAlert()
}

class LoadImageVC: UIViewController, CleanSwiftDisplayLogic {
	func alertOtherMistake() {
		
	}

    var interactor: CleanSwiftBusinessLogic?
    var presenter: CleanSwiftPresentationLogic?
//    var delegate: ImageImportProtocol?
    let imageView = UIImageView()
    let galleryButton = UIButton(type: .custom)
    let nextButton = UIButton(type: .custom)
	var predictedCar = UILabel()
    var helper = Styler()

	let viewController : ViewController = {
		let viewController = ViewController()
		return viewController
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.white
		navigationItem.title = "Найди свою машину"

		buildView()

	}

	func displayCarName(carName: String) {
		predictedCar.text = carName
	}

	@objc func setImage() {
		let request = ImgLoadingModel.ImageData.Request()
		interactor?.setImage(request: request)
	}

	func showImagePickerView(_ imagePickerController: UIImagePickerController) {
        present(imagePickerController, animated: true, completion: nil)
	}

	func displayImage(viewModel: ImgLoadingModel.ImageData.ViewModel)
	{
		imageView.image = viewModel.image
		imageView.contentMode = .scaleAspectFit
		dismiss(animated: true, completion: nil)
	}

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

	private func updateLayout(with size: CGSize) {
//	   tableView.frame = CGRect.init(origin: .zero, size: size)
	}

	func setup() {
	        let presenter = PresenterForLoadImageView()
	        let interactor = InteractorForLoadImageView()

	        interactor.presenter = presenter
	        self.interactor = interactor
	        presenter.interactor = interactor
	        presenter.viewController = self
	        self.presenter = presenter
	    }

	func buildView() {
        predictedCar.frame = CGRect(x: 30, y: 400, width: view.frame.width - 60, height: 150)

        imageView.frame = CGRect(x: 30, y: 90, width: view.frame.width - 60, height: 150)
        imageView.image = UIImage(named: "noImg")
        imageView.contentMode = .scaleAspectFill
        galleryButton.frame = CGRect(x: 30, y: 330, width: view.frame.width - 60, height: 50)
        galleryButton.setTitle("Загрузить фото", for: .normal)
        galleryButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
		nextButton.frame = CGRect(x: 30, y: 390, width: view.frame.width - 60, height: 50)
        nextButton.setTitle("Далее", for: .normal)
        nextButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
		helper.styleHollowButton(nextButton)
        helper.styleFilledButton(galleryButton)

        view.addSubview(galleryButton)
        view.addSubview(nextButton)
        view.addSubview(imageView)
		view.addSubview(predictedCar)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.backgroundColor = UIColor.white
	}
	
	@objc func showActionSheet () {
		let actionSheet = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
		let camera = UIAlertAction(title: "Сделать снимок", style: .default) { action in
			let request = ImgLoadingModel.ImageData.Request()
			self.interactor?.accessCamera(request: request)
		}
		let gallery = UIAlertAction(title: "Галлерея", style: .default) { action in
			let request = ImgLoadingModel.ImageData.Request()
			self.interactor?.showGallery(request: request)
		}
		let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
		actionSheet.addAction(camera)
		actionSheet.addAction(gallery)
		actionSheet.addAction(cancel)
		present(actionSheet, animated: true, completion: nil)
	}


	func alertNoCam() {
		let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
	}

//	func alertOtherMistake() {
//		self.present(AlertAnswer.otherProblem.alert, animated: true, completion: nil)
//	}

}


class TableViewCell: UITableViewCell {
	override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
   }
}
